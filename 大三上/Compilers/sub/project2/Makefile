CC=gcc
FLEX=flex
BISON=bison

.PHONY: bplc clean

bplc: bin/bplc

bin/bplc: bin head.o syntax.tab.o
	$(CC) -o bin/bplc head.o syntax.tab.o -lfl -ly

head.o: head.cpp
	$(CXX) -c head.cpp -o head.o

syntax.tab.o: syntax.tab.c
	$(CC) -c syntax.tab.c -o syntax.tab.o

syntax.tab.c: syntax.y lex.yy.c
	$(BISON) -t -d syntax.y

lex.yy.c: lex.l
	$(FLEX) lex.l

bin:
	mkdir bin

clean:
	@rm -f lex.yy.c syntax.tab.* ./bin/* *.o
