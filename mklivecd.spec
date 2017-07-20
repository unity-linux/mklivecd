%define debug_package %{nil}

Summary:	Builds a LiveCD from an existing Mageia Linux installation
Name:		mklivecd
Version:	0.9.5
Release:	1
License:	GPLv2
Group:		System/Packaging
URL:		https://github.com/unity-linux/mklivecd/
Source0:	%{name}-%{version}.tar.xz
BuildRequires:	intltool
Requires:	busybox-static >= 1.18.4
Requires:	cdrkit-genisoimage
Requires:	squashfs-tools >= 4.2
Requires:	syslinux >= 4.00
Requires:	drakx-installer-binaries-probe
Suggests:	plymouth

%description
The mklivecd tools are dedicated to providing you with the capability to
create your own LiveCD or LiveDVD from a currently installed Mageia 
distribution.  It can be used to create your own travelling Mageia-based 
LiveCD, specialised LiveCD featuring custom-developed applications or to 
put together a demo disk to show off the power of our favourite OS. The 
possibilities are endless!

Created CD's feature automatic hardware detection and setup. In addition, 
it utilises compression technology allowing you to build a LiveCD from a 
partition much larger than will typically fit on a CD or DVD.(Up to 2GB 
for a normal 650MB CD or around 10GB for a normal 4GB DVD) When booting 
from this LiveCD, the data is transparently decompressed as needed with 
almost no performance impact.

%prep
%setup -q

%build
%make_build

%install
%make_install

%find_lang mklivecd
%find_lang mkremaster
cat mklivecd.lang mkremaster.lang >> %{name}.list

%files -f %{name}.list
%doc AUTHORS COPYING CHANGELOG FAQ README.md README.BOOTCODES README.USB TODO
%{_sbindir}/mklivecd
%{_sbindir}/hwdetect2
%{_sbindir}/mkremaster
%dir %{_datadir}/mklivecd
%{_datadir}/mklivecd/linuxrc
%{_datadir}/mklivecd/halt.local
%{_datadir}/mklivecd/rc.sysinit
%{_datadir}/mklivecd/gfxboot.cfg
%{_datadir}/mklivecd/fstab
%{_datadir}/mklivecd/finish-install
%{_datadir}/applications/mkremaster-kde.desktop
%{_datadir}/applications/mkremaster.desktop
%{_datadir}/applications/mkremaster-tinyme.desktop
%{_datadir}/pixmaps/mkremaster.png
