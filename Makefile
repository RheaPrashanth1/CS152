
all:
			flex mini_l.lex
			gcc lex.yy.c -lfl -o lexer
			cat fibonacci.min | ./lexer
clean:		
			rm -rf lex.yy.c lexer
