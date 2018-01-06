COMPILER=nasm

OBJDIR=obj
BINDIR=bin

## Removes files from the object directory
_clean_obj_dir:
	@rm -rfv $(OBJDIR)/*.o

## Removes files from the bin directory
_clean_bin_dir:
	@rm -rfv $(BINDIR)/*

## Calls all cleaning functions 
clean: _clean_obj_dir _clean_bin_dir
	@echo "Cleaned files out"
