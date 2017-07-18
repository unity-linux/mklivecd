
DESKTOPINFILES = ${wildcard *.desktop.in}
DESKTOPFILES = ${patsubst %.in, %, $(DESKTOPINFILES)}

all: $(DESKTOPFILES)

%.desktop: %.desktop.in
	@intltool-merge po/ -d -u $< $@
	@echo "$@ generated in $$PWD"

clean:
	@rm -f $(DESKTOPFILES)
	@echo
	@echo "Cleaning complete"
	@echo

install:
	@echo