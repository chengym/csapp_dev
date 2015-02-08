PWD:=$(shell pwd)
TOP = .
CODE_DIR=$(TOP)/code
DIRS = $(CODE_DIR)/src $(CODE_DIR)/conc #$(CODE_DIR)/src $(CODE_DIR)/data $(CODE_DIR)/ecf \
	   #$(CODE_DIR)/intro $(CODE_DIR)/io $(CODE_DIR)/link

include $(TOP)/config
include $(TOP)/Make.rules
LIBCSAPP=./lib/libcsapp.a

.PHONY: all clean
all: $(DIRS)
	@for dir in $(DIRS); do $(MAKE) -C $$dir; cp $$dir/*.bin $(BIN_PATH) -f; done

clean:
	@for dir in $(DIRS); do $(MAKE) -C $$dir clean; done
 
