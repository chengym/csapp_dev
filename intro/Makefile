TOP=../
include $(TOP)/Make.rules
include $(TOP)/config

SRCS := $(wildcard *.c *.cxx)
OBJS := $(patsubst %.cxx,%.o,$(patsubst %.c,%.o,$(SRCS)))
BIN  := $(patsubst %.c,%.bin,$(SRCS))

$(BIN): $(OBJS)
	$(HOSTCC) -o $@ $(CFLAGS) $^
	$(OBJDUMP) -d $@ > $@.dump
	@ echo "Finish building $(BIN)..."

clean:
	rm -fr $(OBJS) $(BIN) .depend *.o *.elf *.dump *.bin
	@ echo "Cleaning $(BIN)..."

