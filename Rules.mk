# $Id: Rules.mk,v 1.35 2006/04/23 03:36:23 tom_kelly33 Exp $

# User parameters: These are parameters that can be changed for
# your installation (See the FAQ for valid options)
# The preferred way to change/overeride this is with a
#     make DEF_KEYBOARD=dvorak
DEF_KEYBOARD=us
DEF_UNION=overlayfs

# these two parameters need to match up to allow splash to work
# The preferred way to change/override this is with a
#     make DEF_RESOLUTION=800x600 DEF_VGAMODE=788
DEF_RESOLUTION=800x600
DEF_VGAMODE=788

# splash progress bar parameters
# MAX_SPLASH: default: 65534. With a patched bootsplash, the
# preferred way to change/override this is with a
#     make MAX_SPLASH=32767
MAX_SPLASH=32768

### no more user-editable parameters after this line

# various script number of splash steps
VAL_SPLASH_LINUXRC=0
VAL_SPLASH_SYSINIT=1
VAL_SPLASH_HWDETECT=17
VAL_SPLASH_FULL=20

# Version identifiers: These should only be changed by the release
# manager as part of making a new release
PKGNAME=mklivecd
MAJORVER=0
MINORVER=9
PATCHVER=7
RELVER=21
CVSVER=no

# Automatic variable updates, leave alone
MKLIVECDVER=$(MAJORVER).$(MINORVER).$(PATCHVER)
ifeq "$(CVSVER)" "yes"
	CVSDATE=$(shell date +%Y%m%d)
	MKLIVECDREL=$(CVSDATE).$(RELVER)
	ARCHIVEVER=$(MKLIVECDVER)-$(CVSDATE)
else
	MKLIVECDREL=$(RELVER)
	ARCHIVEVER=$(MKLIVECDVER)
endif
KERNELVER=$(shell uname -r)
SPECDATE=$(shell LC_ALL=C date +"%a %b %e %Y")

# Internal directories: don't edit
DISTDIR=dist
SRCDIR=src
MKLIVECDPODIR=src/po
MKREMASTERDIR=src/mkremaster
MKREMASTERPODIR=src/mkremaster/po
MKLIVECDDIST=$(PKGNAME)-$(ARCHIVEVER)

# Destination directories: you can change the locations for your site either
# here or as an override on the make command-line (preferred)
DESTDIR=
prefix=/usr
SBINPREFIX=$(prefix)
BINDIR=$(prefix)/bin
LIBDIR=$(prefix)/lib/$(PKGNAME)
SHAREDIR=$(prefix)/share/$(PKGNAME)
ICONSDIR=$(prefix)/share/pixmaps
DOCDIR=$(prefix)/share/doc/$(PKGNAME)-$(MKLIVECDVER)
SBINDIR=$(SBINPREFIX)/sbin
RCDIR=$(SHAREDIR)/init.d
DESKTOPDIR=$(prefix)/share/applications
LOCALEDIR=$(prefix)/share/locale
DRACUTDIR=/etc/dracut.conf.d/
MODDIR=/etc/modprobe.d/

# Utility programs: you can change the locations for your site either
# here or as an override on the make command-line (preferred)
BZIP2=$(shell which bzip2)
CAT=$(shell which cat)
CP=$(shell which cp)
GZIP=$(shell which gzip)
INSTALL=$(shell which install)
MD5SUM=$(shell which md5sum)
MKDIR=$(shell which mkdir)
LN=$(shell which ln)
RM=$(shell which rm)
RPMBUILD=$(shell which rpmbuild)
SED=$(shell which sed)
TAR=$(shell which tar)
TOUCH=$(shell which touch)

# these are files in the root dir
DOCDIST=\
	AUTHORS \
	CHANGELOG \
	COPYING \
	FAQ \
	README.md \
	README.BOOTCODES \
	README.USB \
	TODO

BUILDDIST=\
	Makefile \
	Rules.mk \
	$(PKGNAME).spec.in

# these are files in the src dir
SRCDIST=\
	$(SRCDIR)/$(PKGNAME).in \
	$(SRCDIR)/gfxboot.cfg.in \
	$(SRCDIR)/finish-install.in \
	$(SRCDIR)/60-live.conf.in \
	$(SRCDIR)/blacklist_ide.conf.in \

# these are files in the src/po dir
MKLIVECDPODIST=\
	$(MKLIVECDPODIR)/Makefile \
	$(MKLIVECDPODIR)/mklivecd.pot \
	$(MKLIVECDPODIR)/*.po
	
# these are files in the src/mkremaster dir
MKREMASTERDIST=\
	$(MKREMASTERDIR)/mkremaster.in \
	$(MKREMASTERDIR)/mkremaster.desktop.in \
	$(MKREMASTERDIR)/mkremaster-kde.desktop.in \
	$(MKREMASTERDIR)/mkremaster-tinyme.desktop.in \
	$(MKREMASTERDIR)/mkremaster.png \
	$(MKREMASTERDIR)/Makefile

# these are files in the src/mkremaster/po dir
MKREMASTERPODIST=\
	$(MKREMASTERPODIR)/POTFILES.in \
	$(MKREMASTERPODIR)/Makefile \
	$(MKREMASTERPODIR)/mkremaster.pot \
	$(MKREMASTERPODIR)/*.po
