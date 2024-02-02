all: tex

tex: tex.c
# Add -fsanitize=address to compile with ASAN. Incompatible with valgrind.
	$(CC) -o tex tex.c -g -O0 -Wall -Wextra -Werror -W -pedantic -std=c11 -Wformat=2 -Wswitch-default -Wunused

indent:
	astyle -n --indent=spaces=4 --style=attach --max-code-length=160 --lineend=linux --delete-empty-lines --convert-tabs --align-pointer=name --add-brackets --keep-one-line-blocks tex.c

lint:
	cppcheck --enable=all --inconclusive tex.c

clean:
	rm -f tex