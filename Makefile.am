ACLOCAL_AMFLAGS = -I m4

include_HEADERS = dummy.h
lib_LTLIBRARIES = libdummy.la
bin_PROGRAMS = run_dummy
LDADD = libdummy.la

libdummy_la_SOURCES = dummy.c

run_dummy_SOURCES = run_dummy.c

TESTS = run_dummy

# alias for 'make check' using 'make test'
test: check
