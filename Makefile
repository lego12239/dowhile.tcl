CFLAGS := -Wall -O2
LDFLAGS :=

libdowhile.so: dowhile.c
	gcc -shared -fPIC -o $@ $^ -DUSE_TCL_STUBS $(CFLAGS) $(LDFLAGS) -ltclstub

clean:
	rm -f *.o *~

clean-all: clean
	rm -f libdowhile.so

test:
	cd tests && ./tests.tcl
