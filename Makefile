BIN_PATH = bin
LEXY_PATH = lexyacc-code_lab3

calc3:
	bison	-o $(BIN_PATH)/y.tab.c -y -d $(LEXY_PATH)/$@.y
	flex	-o $(BIN_PATH)/lex.yy.c $(LEXY_PATH)/$@.l
	gcc	-c $(BIN_PATH)/lex.yy.c -I$(LEXY_PATH) -o $(BIN_PATH)/lex.yy.o
	gcc	-c $(BIN_PATH)/y.tab.c  -I$(LEXY_PATH) -o $(BIN_PATH)/y.tab.o
	gcc 	$(BIN_PATH)/y.tab.o $(BIN_PATH)/lex.yy.o $(LEXY_PATH)/$@i.c -I$(BIN_PATH) -o $(BIN_PATH)/$@i.exe
	gcc 	$(BIN_PATH)/y.tab.o $(BIN_PATH)/lex.yy.o $(LEXY_PATH)/$@b.c -I$(BIN_PATH) -o $(BIN_PATH)/$@b.exe



