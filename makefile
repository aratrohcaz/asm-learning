COMPILER=nasm
ASM_FLAGS=-f elf

LD=ld
LD_FLAGS=-m elf_i386 -s

OBJDIR=obj
BINDIR=bin
SRCDIR=src

#### COMPILING ####
## nasm -f elf hello_world.asm
## ld -m elf_i386 -s -o hello hello_world.o
build:
	$(COMPILER) $(ASM_FLAGS) $(SRCDIR)/$(TARGET).asm -o $(OBJDIR)/$(TARGET).o
	$(LD) $(LD_FLAGS) -o $(BINDIR)/$(TARGET) $(OBJDIR)/$(TARGET).o


#### CLEAN UP ####
## Removes files from the object directory
_clean_obj_dir:
	@rm -rfv $(OBJDIR)/*.o

## Removes files from the bin directory
_clean_bin_dir:
	@rm -rfv $(BINDIR)/*

## Calls all cleaning functions 
clean: _clean_obj_dir _clean_bin_dir
	@echo "Cleaned files out"
