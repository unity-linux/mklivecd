include ../../../Rules.mk

NAME = mkremaster

# file to search translatable strings in
SH_FILES = ../mkremaster.in

POFILES = $(shell ls *.po)
MOFILES = $(POFILES:%.po=%.mo)
LANGS = $(POFILES:%.po=%)

GOALS = $(NAME).pot $(POFILES) $(MOFILES)

all: $(GOALS)

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

%.mo: %.po
	@msgfmt -o $@ $<
	@echo "$@ generated in $$PWD"

$(NAME).pot: $(SH_FILES) POTFILES.in
	@intltool-update --gettext-package desktopstuff --pot
	@xgettext -k__ --add-comments=TRANSLATORS --language=Shell $(SH_FILES) -o $(NAME)_tmp1.pot
	@sed -e 's/\\\\/\\/g' $(NAME)_tmp1.pot > $(NAME)_tmp2.pot
	@msgcat --use-first $(NAME)_tmp2.pot desktopstuff.pot > $(NAME).pot
	@rm -f $(NAME)_tmp1.pot $(NAME)_tmp2.pot desktopstuff.pot
	@echo
	@echo "New $(NAME).pot generated from $(SH_FILES)"
	@echo 

update_n_merge: $(NAME).pot merge

merge:
	@for n in $(POFILES); do \
		echo "Merging $$n"; \
		msgmerge -C "$$n" "$$n" $(NAME).pot > "$$n"t; \
		mv -f "$$n"t "$$n"; \
	done
	@echo
	@echo "All catalogs updated to current template"
	@echo 
