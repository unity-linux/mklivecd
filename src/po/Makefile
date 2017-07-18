include ../../Rules.mk

NAME = mklivecd

PL_FILES = ../$(NAME).in

POFILES = $(wildcard *.po)
MOFILES = $(POFILES:%.po=%.mo)
LANGS = $(POFILES:%.po=%)

all: $(NAME).pot $(POFILES) $(MOFILES)

%.mo: %.po
	@msgfmt -o $@ $<
	@echo "$@ generated in $$PWD"

update_n_merge: $(NAME).pot merge

merge:
	@for n in $(POFILES); do \
		echo "Merging $$n"; \
		msgmerge "$$n" $(NAME).pot > "$$n"t; \
		mv -f "$$n"t "$$n"; \
	done
	@echo
	@echo "All catalogs updated to current template"
	@echo 

$(NAME).pot:
	@xgettext -kN --add-comments=TRANSLATORS --language=Perl $(PL_FILES) -o $(NAME).pot
	@echo
	@echo "New $(NAME).pot generated from $(PL_FILES)"
	@echo 

install: all
	@echo
	@for l in $(LANGS); do \
		install -d $(DESTDIR)$(LOCALEDIR)/$$l/LC_MESSAGES; \
		install -m 644 $$l.mo $(DESTDIR)$(LOCALEDIR)/$$l/LC_MESSAGES/$(NAME).mo 2> /dev/null; \
		echo "Installed $$l.mo to $(DESTDIR)$(LOCALEDIR)/$$l/LC_MESSAGES"; \
	done
	@echo

clean:
	@rm -rf $(MOFILES) $(POFILES:%=%t)
	@find -name '*~' -exec rm {} \;
	@echo
	@echo "Cleaning complete"
	@echo