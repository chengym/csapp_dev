PWD:=$(shell pwd)
DIRS = src conc data ecf intro io link
TOP = .

include $(TOP)/config
include $(TOP)/Make.rules

.PHONY: all clean
all: $(DIRS)
	@for dir in $(DIRS); do $(MAKE) -B -C $$dir; done

clean:
	@for dir in $(DIRS); do $(MAKE) -C $$dir clean; done
 
