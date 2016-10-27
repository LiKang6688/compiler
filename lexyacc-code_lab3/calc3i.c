#include <stdio.h>
#include "calc3.h"
#include "y.tab.h"

static int lbl;

int ex(nodeType *p) {
    int lbl1, lbl2;

    if (!p) return 0;
    switch(p->type) {
    case typeCon:
        printf("\tpushq\t$%d\n", p->con.value);
        break;
    case typeId:
        printf("\tpushq\t%c\n", p->id.i + 'a');
        break;
    case typeOpr:
        switch(p->opr.oper) {
        case WHILE:
            printf("L%03d:\n", lbl1 = lbl++);
            ex(p->opr.op[0]);
            printf("\tpopq\t%%rcx\n");
	    printf("\tjecxz\tL%03d\n", lbl2 = lbl++);
            ex(p->opr.op[1]);
            printf("\tjmp\tL%03d\n", lbl1);
            printf("L%03d:\n", lbl2);
            break;
        case IF:
            ex(p->opr.op[0]);
            if (p->opr.nops > 2) {
                /* if else */

                printf("\tpopq\t%%rcx\n");
                printf("\tjecxz\tL%03d\n", lbl1 = lbl++);
                ex(p->opr.op[1]);
                printf("\tjmp\tL%03d\n", lbl2 = lbl++);
                printf("L%03d:\n", lbl1);
                ex(p->opr.op[2]);
                printf("L%03d:\n", lbl2);
            } else {
                /* if */
		printf("\tpopq\t%%rcx\n");
                printf("\tjecxz\tL%03d\n", lbl1 = lbl++);
                ex(p->opr.op[1]);
                printf("L%03d:\n", lbl1);
            }
            break;
        case PRINT:
            ex(p->opr.op[0]);
            printf("\tpushq\t$int\n");
            printf("\tcall\tprintf\n");
            break;
        case '=':
            ex(p->opr.op[1]);
            printf("\tpopq\t%c\n", p->opr.op[0]->id.i + 'a');
            break;
        case UMINUS:
            ex(p->opr.op[0]);
            printf("\tpopq %%rax\n\
                    \tnegq %%rax\n\
                    \tpushq %%rax\n");
                    break;
	case FACT:
  	    ex(p->opr.op[0]);
	    printf("\tcall fact\n\
	            \tpushq %%rax\n");
	            break;
	case LNTWO:
	    ex(p->opr.op[0]);
	    printf("\tcall lntwo\n\
	            \tpushq %%rax\n");
	             break;
        default:
            ex(p->opr.op[0]);
            ex(p->opr.op[1]);
             if (p->opr.oper != GCD)
              {
	    	printf("\tpopq\t%%rbx\n");
	    	printf("\tpopq\t%%rax\n");
	      }
            switch(p->opr.oper) {
	    case GCD:
		printf("\tcall gcd\n\
                        \tpushq\t%%rax\n");
		         break;

            case '+': printf("\taddq\t %%rbx, %%rax\n\
                              \tpushq\t%%rax\n"); 
                               break;

            case '-': printf("\tsubq\t %%rbx, %%rax\n\
                              \tpushq\t%%rax\n");  
                                break;

            case '*': printf("\timulq\t %%rbx\n\
                              \tpushq\t%%rax\n"); 
                                break;

            case '/': printf("\tcltd\n\
                              \tidivq %%rbx\n\
                              \tpushq\t%%rax\n"); 
		                break;
            case '<': printf("\txorq\t%%rcx, %%rcx\n\
                              \tcmpq\t%%rbx, %%rax\n\
                              \tsetl\t%%ch\n\
                              \tpushq\t%%rcx\n");
		                break;

            case '>': printf("\txorq\t%%rcx, %%rcx\n\
                              \tcmpq\t%%rbx, %%rax\n\
                              \tsetg\t%%ch\n\
                              \tpushq\t%%rcx\n");
		               break;

             case GE: printf("\txorq\t%%rcx, %%rcx\n\
                              \tcmpq\t%%rbx, %%rax\n\
                              \tsetge\t%%ch\n\
                              \tpushq\t%%rcx\n");
		               break;

            case LE:  printf("\txorq\t%%rcx, %%rcx\n\
                              \tcmpq\t%%rbx, %%rax\n\
                              \tsetle\t%%ch\n\
                              \tpushq\t%%rcx\n");
		               break;

            case NE:  printf("\txorq\t%%rcx, %%rcx\n\
                              \tcmpq\t%%rbx, %%rax\n\
                              \tsetne\t%%ch\n\
                              \tpushq\t%%rcx\n");
		               break;

            case EQ:  printf("\txorq\t%%rcx, %%rcx\n\
                              \tcmpq\t%%rax, %%rbx\n\
                              \tsete\t%%ch\n\
                              \tpushq\t%%rcx\n");		
                                break;
            }

        }
    }
    return 0;
}
