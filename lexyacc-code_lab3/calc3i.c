#include <stdio.h>
#include "calc3.h"
#include "y.tab.h"

static int lbl;

int ex(nodeType *p) {
    int lbl1, lbl2;

    if (!p) return 0;
    switch(p->type) {
    case typeCon:
        printf("\tpush\t$%d\n", p->con.value);
        break;
    case typeId:
        printf("\tpush\t%c\n", p->id.i + 'a');
        break;
    case typeOpr:
        switch(p->opr.oper) {
        case WHILE:
            printf("L%03d:\n", lbl1 = lbl++);
            ex(p->opr.op[0]);
            printf("\tpop\t%%rcx\n");
	    printf("\tjecxz\tL%03d\n", lbl2 = lbl++);
            ex(p->opr.op[1]);
            printf("\tjmp\tL%03d\n", lbl1);
            printf("L%03d:\n", lbl2);
            break;
        case IF:
            ex(p->opr.op[0]);
            if (p->opr.nops > 2) {
                /* if else */

                printf("\tpop\t%%rcx\n");
                printf("\tjecxz\tL%03d\n", lbl1 = lbl++);
                ex(p->opr.op[1]);
                printf("\tjmp\tL%03d\n", lbl2 = lbl++);
                printf("L%03d:\n", lbl1);
                ex(p->opr.op[2]);
                printf("L%03d:\n", lbl2);
            } else {
                /* if */
		printf("\tpop\t%%rcx\n");
                printf("\tjecxz\tL%03d\n", lbl1 = lbl++);
                ex(p->opr.op[1]);
                printf("L%03d:\n", lbl1);
            }
            break;
        case PRINT:     
            ex(p->opr.op[0]);
            printf("\tpush\t$int\n");
            printf("\tcall\tprintf\n");
            break;
                         
        case '=':       
            ex(p->opr.op[1]);
            printf("\tpop\t%c\n", p->opr.op[0]->id.i + 'a');
            break;
        case UMINUS:
            ex(p->opr.op[0]);
            printf("\tpop %%rax\n\
                    \tneg %%rax\n\
                    \tpush %%rax\n");
                    break;
	case FACT:
  	    ex(p->opr.op[0]);
	    printf("\tcall fact\n\
	            \tpush %%rax\n");
	            break;
	case LNTWO:
	    ex(p->opr.op[0]);
	    printf("\tcall lntwo\n\
	            \tpush %%rax\n");
	             break;
        default:
            ex(p->opr.op[0]);
            ex(p->opr.op[1]);
             if (p->opr.oper != GCD) 
              {
	    	printf("\tpop\t%%ebx\n");
	    	printf("\tpop\t%%eax\n");  
	      } 
                         
            switch(p->opr.oper) {
	    case GCD:  
		printf("\tcall gcd\n\
                        \tpush\t%%rax\n");
		         break;

            case '+': printf("\tadd\t %%rbx, %%rax\n\
                              \tpush\t%%rax\n"); 
                               break;

            case '-': printf("\tsub\t %%rbx, %%rax\n\
                              \tpush\t%%rax\n");  
                                break;

            case '*': printf("\tmul\t %%rbx\n\
                              \tpush\t%%rax\n"); 
                                break;

            case '/': printf("\tcltd\n\
                              \tidiv %%rbx\n\
                              \tpush\t%%rax\n"); 
		                break;
                
            case '<': printf("\txor\t%%rcx, %%rcx\n\
                              \tcmp\t%%rbx, %%rax\n\
                              \tsetl\t%%ch\n\
                              \tpush\t%%rcx\n");
		                break;

            case '>': printf("\txor\t%%rcx, %%rcx\n\
                              \tcmp\t%%rbx, %%rax\n\
                              \tsetg\t%%ch\n\
                              \tpush\t%%rcx\n");
		               break;

             case GE: printf("\txor\t%%rcx, %%rcx\n\
                              \tcmp\t%%rbx, %%rax\n\
                              \tsetge\t%%ch\n\
                              \tpush\t%%rcx\n");
		               break;

            case LE:  printf("\txor\t%%rcx, %%rcx\n\
                              \tcmp\t%%rbx, %%rax\n\
                              \tsetle\t%%ch\n\
                              \tpush\t%%rcx\n");
		               break;

            case NE:  printf("\txor\t%%rcx, %%rcx\n\
                              \tcmp\t%%rbx, %%rax\n\
                              \tsetne\t%%ch\n\
                              \tpush\t%%rcx\n");
		               break;

            case EQ:  printf("\txor\t%%rcx, %%rcx\n\
                              \tcmp\t%%rax, %%rbx\n\
                              \tsete\t%%ch\n\
                              \tpush\t%%rcx\n");		
                                break;
           
            }
              
            
           
	
        }
    }
    return 0;
}
