# GNU make Makefile for sph2pipe

SRC = file_headers.c shorten_x.c sph2pipe.c
CCFLAGS += -Wno-implicit-function-declaration -Wno-implicit-int -Wno-write-strings

.PHONY: all check clean distclean

all: sph2pipe

sph2pipe: $(SRC)
	$(CC) -o sph2pipe -s -O2 $(CCFLAGS) $(SRC)

# Tests are very noisy and do not output anything sensibe.
check: sph2pipe
	cd test && ln -sf ../sph2pipe . && ./test_all.pl >/dev/null
	@echo "Tests passed."

clean distclean:
	rm -f sph2pipe && \
	cd test && \
	rm -f *.aif *.au *.raw *.wav ????.sph \
	    123_1alaw.sph 123_1pcbe.sph 123_1pcle.sph 123_1ulaw.sph \
	    123_2pcbe.sph 123_2pcle.sph 123_2ulaw.sph \
	    outfile-md5.list sph2pipe
