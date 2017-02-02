hello: hello.c
	$(CC) hello.c -o hello

test:
	./hello
