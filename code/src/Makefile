#
# Makefile for misc library.
#

CP = cp
RM = rm -fr
HOST_LIB:=/lib/x86_64-linux-gnu/
SHARED_CSAPP = libcsapp.so
HEADER = ../include
CCFLAGS = -Wall -O2 -fPIC -shared -I $(HEADER)

SRCS := $(wildcard *.c)
OBJS := $(patsubst %.c,%.o,$(SRCS))

all:$(SHARED_CSAPP)

$(SHARED_CSAPP):$(OBJS)
	@$(CC) $^ $(CCFLAGS) -o $@
	@sudo $(CP) -fr $(SHARED_CSAPP) $(HOST_LIB)
	@echo "Finish build $@"

%.o: %.c
	@$(CC) $(CCFLAGS) -c $<
	@echo CC $@

clean:
	@$(RM) *.o a.out core temp.* $(LIBCSAPP)
	@sudo $(RM) $(HOST_LIB)/$(SHARED_CSAPP)
	@echo "Finish cleanup......"
