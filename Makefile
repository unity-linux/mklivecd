
include Rules.mk

PODIRS = $(MKLIVECDPODIR) $(MKREMASTERPODIR)
SUBDIRS = $(MKREMASTERDIR) $(PODIRS)

all:
	@for d in $(SUBDIRS); do ( cd $$d ; make ) ; done
	@$(MKDIR) -p $(DISTDIR)
	@$(CP) $(MKREMASTERDIR)/mkremaster.in $(DISTDIR)/mkremaster
	@$(CP) $(MKREMASTERDIR)/*.desktop $(DISTDIR)/
	@$(CP) $(MKREMASTERDIR)/mkremaster.png $(DISTDIR)/
	@$(CP) $(SRCDIR)/gfxboot.cfg.in $(DISTDIR)/gfxboot.cfg
	@$(CP) $(SRCDIR)/finish-install.in $(DISTDIR)/finish-install
	@$(CP) $(SRCDIR)/60-live.conf.in $(DISTDIR)/60-live.conf
	@$(CP) $(SRCDIR)/blacklist_ide.conf.in $(DISTDIR)/blacklist_ide.conf
	@$(CAT) $(SRCDIR)/$(PKGNAME).in | \
		$(SED) -e 's,@PKGNAME@,$(PKGNAME),g' | \
		$(SED) -e 's,@MKLIVECDVER@,$(ARCHIVEVER),g' | \
		$(SED) -e 's,@DEF_KEYBOARD@,$(DEF_KEYBOARD),g' | \
		$(SED) -e 's,@DEF_UNION@,$(DEF_UNION),g' | \
		$(SED) -e 's,@DEF_RESOLUTION@,$(DEF_RESOLUTION),g' | \
		$(SED) -e 's,@DEF_VGAMODE@,$(DEF_VGAMODE),g' \
			>$(DISTDIR)/$(PKGNAME)

install:
	@echo
	@echo '                     ***Installation START***'
	@echo
	@$(MKDIR) -p $(DESTDIR)$(SHAREDIR)
	@echo 'Created directory $(DESTDIR)$(SHAREDIR)'
	@$(MKDIR) -p $(DESTDIR)$(SBINDIR)
	@echo 'Created directory $(DESTDIR)$(SBINDIR)'
	@$(MKDIR) -p $(DESTDIR)$(DESKTOPDIR)
	@echo 'Created directory $(DESTDIR)$(DESKTOPDIR)'
	@$(MKDIR) -p $(DESTDIR)$(ICONSDIR)
	@echo 'Created directory $(DESTDIR)$(ICONSDIR)'
	@$(MKDIR) -p $(DESTDIR)$(DRACUTDIR)
	@echo 'Created directory $(DESTDIR)$(DRACUTDIR)'
	@$(INSTALL) -m 644 $(DISTDIR)/*.desktop $(DESTDIR)$(DESKTOPDIR)
	@echo 'Installed desktop files to $(DESTDIR)$(DESKTOPDIR)'
	@$(INSTALL) -m 755 $(DISTDIR)/$(PKGNAME) $(DESTDIR)$(SBINDIR)
	@echo 'Installed $(PKGNAME) to $(DESTDIR)$(SBINDIR)'
	@$(INSTALL) -m 755 $(DISTDIR)/mkremaster $(DESTDIR)$(SBINDIR)
	@echo 'Installed mkremaster to $(DESTDIR)$(SBINDIR)'
	@$(INSTALL) -m 644 $(DISTDIR)/mkremaster.png $(DESTDIR)$(ICONSDIR)
	@echo 'Installed mkremaster.png to $(DESTDIR)$(ICONSDIR)'
	@$(INSTALL) -m 644 $(DISTDIR)/gfxboot.cfg $(DESTDIR)$(SHAREDIR)
	@echo 'Installed gfxboot.cfg to $(DESTDIR)$(SHAREDIR)'
	@$(INSTALL) -m 755 $(DISTDIR)/finish-install $(DESTDIR)$(SHAREDIR)
	@echo 'Installed finish-install to $(DESTDIR)$(SHAREDIR)'
	@$(INSTALL) -m 644 $(DISTDIR)/60-live.conf $(DESTDIR)$(DRACUTDIR)
	@echo 'Installed dracut module to $(DESTDIR)$(DRACUTDIR)'
	@$(INSTALL) -m 644 $(DISTDIR)/blacklist_ide.conf $(DESTDIR)$(MODDIR)
	@echo 'Installed blacklist_ide.conf to $(DESTDIR)$(DRACUTDIR)'
	@for d in $(SUBDIRS); do ( cd $$d ; make $@ ) ; done
	@echo
	@echo '                     ***Installation END***'
	@echo

install-doc:
	$(MKDIR) -p $(DESTDIR)$(DOCDIR)
	$(CP) -f $(DOCDIST) $(DOCDIR)

$(PKGNAME).spec: $(PKGNAME).spec.in
	@$(MKDIR) -p $(DISTDIR)
	@$(CAT) $(PKGNAME).spec.in | \
		$(SED) -e 's,@MKLIVECDVER@,$(MKLIVECDVER),g' | \
		$(SED) -e 's,@MKLIVECDREL@,$(MKLIVECDREL),g'  \
			>$(PKGNAME).spec
	@echo
	@echo "$(PKGNAME).spec generated in $$PWD"
	@echo

spec: $(PKGNAME).spec

lang-update: clean
	@for d in $(PODIRS); do ( cd $$d ; $(RM) -f *.pot ) ; done
	@for d in $(PODIRS); do ( cd $$d ; make update_n_merge ) ; done
	@echo
	@echo "All lang files are now up to date"
	@echo

clean:
	@$(RM) -f *.spec
	@$(RM) -rf $(MKLIVECDDIST)
	@$(RM) -rf $(DISTDIR)
	@$(RM) -rf SRPMS RPMS
	@$(RM) -rf $(MKLIVECDDIST).tar.xz*
	@find -name '*~' -exec $(RM) {} \;
	@for d in $(SUBDIRS); do ( cd $$d ; make $@ ) ; done
	@echo
	@echo "Cleaning complete"
	@echo

dist: spec all
	@$(MKDIR) -p $(MKLIVECDDIST)/$(SRCDIR)
	@$(MKDIR) -p $(MKLIVECDDIST)/$(MKLIVECDPODIR)
	@$(MKDIR) -p $(MKLIVECDDIST)/$(MKREMASTERPODIR)
	@$(CP) $(DOCDIST) $(MKLIVECDDIST)
	@$(CP) $(BUILDDIST) $(MKLIVECDDIST)
	@$(CP) $(SRCDIST) $(MKLIVECDDIST)/$(SRCDIR)
	@$(CP) $(MKLIVECDPODIST) $(MKLIVECDDIST)/$(MKLIVECDPODIR)
	@$(CP) $(MKREMASTERDIST) $(MKLIVECDDIST)/$(MKREMASTERDIR)
	@$(CP) $(MKREMASTERPODIST) $(MKLIVECDDIST)/$(MKREMASTERPODIR)

tar: dist
	@$(CP) $(PKGNAME).spec $(MKLIVECDDIST)/$(PKGNAME).spec
	@$(TAR) -Jcvf $(MKLIVECDDIST).tar.xz $(MKLIVECDDIST)
	@$(MD5SUM) $(MKLIVECDDIST).tar.xz \
		>$(MKLIVECDDIST).tar.xz.md5
	@$(RM) -rf $(MKLIVECDDIST)
	@echo
	@echo "$(MKLIVECDDIST).tar.xz and $(MKLIVECDDIST).tar.xz.md5 generated in $$PWD"
	@echo

rpm: tar
	$(RPMBUILD) "--define" "_topdir $(shell pwd)" -ta $(MKLIVECDDIST).tar.xz --clean
	@$(RM) -rf SOURCES SPECS BUILD BUILDROOT

srpm: tar
	$(RPMBUILD) "--define" "_topdir $(shell pwd)" -ts $(MKLIVECDDIST).tar.xz --clean
	@$(RM) -rf SOURCES SPECS BUILD BUILDROOT

version:
	@echo
	@echo "$(PKGNAME), $(MKLIVECDVER)-$(MKLIVECDREL)"
	@echo

maintenance-help:
	@echo
	@echo '                  ********************************'
	@echo '                  ******MKLIVECD MAINTENANCE******'
	@echo '                  ********************************'
	@echo
	@echo '* SPEC UPDATE'
	@echo
	@echo ' Make sure you have bumped the release, or updated the version by'
	@echo ' modifying the values of MAJORVER, MINORVER, PATCHVER, RELVER in'
	@echo ' Rules.mk.'
	@echo ' Bear in mind that VERSION=MAJORVER.MINORVER.PATCHVER, whereas'
	@echo ' RELEASE=RELVER'
	@echo
	@echo ' [Please, note that you can view what the current version and'
	@echo ' release are by running `make version`]'
	@echo 
	@echo ' Once you have done that, and once you are happy with all your'
	@echo ' modifications, update the spec file with the following command:'
	@echo 
	@echo ' make spec-update pname="PKGRNAME" pmail="PKGRMAIL" taglist="TAGS"'
	@echo 
	@echo ' Where:'
	@echo '         PKGRNAME is the name of the packager'
	@echo 
	@echo '         PKGRMAIL is the e-mail address of the packager'
	@echo 
	@echo '         TAGS is a list of sentences to be logged in the Changelog'
	@echo '         in the form'
	@echo '         "-t \"First sentence to log\" -t \"Second sentence to log\""'
	@echo
	@echo ' Example:'
	@echo '          make spec-update pname="Unity packager" \'
	@echo '          pmail="packager@unity-linux.org" taglist="-t \"New version\""'
	@echo
	@echo ' If you are happy with the spec, you must merge back the updated'
	@echo ' Changelog into the spec template $(PKGNAME).spec.in'
	@echo ' In order to do so, use the following command:'
	@echo
	@echo ' make spec-merge'
	@echo
	@echo ' Please, note that you must edit $(PKGNAME).spec.in directly, if you'
	@echo ' need to modify any section of the spec other than the Changelog.'
	@echo
	@echo
	@echo '* TARBALL CREATION'
	@echo
	@echo ' You can easily create a tarball with the updated files with the'
	@echo ' following command:'
	@echo
	@echo ' make tar'
	@echo
	@echo
	@echo '* LANGUAGE FILES UPDATE'
	@echo
	@echo ' To update the template catalog and merge all language files with'
	@echo ' the new template, use the following command:'
	@echo
	@echo ' make lang-update'
	@echo
	@echo
	@echo '* TESTING INSTALL'
	@echo
	@echo ' If you want to check whether the install procedure runs smoothly, you'
	@echo ' might want to install to a different destination (for example: your'
	@echo ' home directory).'
	@echo ' Set the DESTDIR variable (case-sensitive) in this way:'
	@echo
	@echo ' make DESTDIR=/path/to/destination/dir install'
	@echo
	@echo 
	@echo 'NOTE: Whenever you change something, and you want to rebuild the spec,'
	@echo '      the tarball, etc., and especially before committing your changes,'
	@echo '      always launch first:'
	@echo
	@echo '      make clean'
	@echo
	@echo 
