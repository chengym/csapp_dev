TOP=../../..
include $(TOP)/config
include $(TOP)/Make.rules

CFLAGS += -I../../vm

OBJS = mm

all: $(OBJS)

%.o: %.c
	@echo CC $@
	@$(CC) -c -o $*.o $(CFLAGS) $<

clean:
	@echo "Cleaning all test service binaries ..."
	@rm -f $(OBJS) .depend
