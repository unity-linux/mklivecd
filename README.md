# mklivecd: 
has a long and sorted history. It currently lives on in a different
form called mylivecd which was forked for PCLinuxOS. I have decided to 
revive the old version that had been maintained by Unity-Linux until it 
went defunct. mklivecd comes from Mandrake and was dependant on drakxtools.
Newer innerations of Mandrake ie. OpenMandriva no longer depend on these
tools or even use them, however a fork from Mandriva called Mageia that
still uses drakxtools can still utilize this tool, with minimal updates. 
Eventually the dependacy on drakxtools should be dropped and this tool 
should be able to be used on OpenMandriva, Fedora and Mageia as features
in dracut should allow it. However, until then it's current focus will 
be for functionality on Mageia.

Below you will fild the old ReadMe which will eventually be updated.

# $Id: README,v 1.6 2006/04/23 01:55:14 tom_kelly33 Exp $


The package naming tries to follow the Linux kernel approach to
versioning, i.e. versions are in the format "major.minor.patch"
where an uneven minor version number indicates an unstable and/or
testing release.

If you want to contibute, or just fancy running the latest-
greatest version, you can also get the latest development version
from SVN. You will find all the information at:
    http://docs.unity-linux.org/development:packaging:svn

To download a copy of the source code,

ReadOnly SVN interface - as the name implies, allows you to use your favorite 
Subversion client to checkout the whole or any particular portion of Unity 
source repository. Simply download the file 
( http://svn.unity-linux.org/unity_svn_setup_readonly.tgz ) 
and extract it to your $HOME directory. However, if you already have 
file $HOME/.ssh/config present on your system, don't overwrite it but append 
contents of .ssh/config file from inside the tarball to the end of existing file.


Patches, suggestions, flames and general comments are always
welcome at the above address. Good luck!

    - Jaco Greeff <jaco@linuxminicd.org>,
      Wed, Nov 05, 2003

mklivecd, version 0.9.4, http://unity-linux.org/
  
Copyright (C) 2002-2004, Jaco Greeff &lt;jaco@puxedo.org&gt;
  
  
This program is free software; you can redistribute it and/or
  
modify it under the terms of the GNU General Public License
  
as published by the Free Software Foundation; either version 2
  
of the License, or (at your option) any later version.
  
```
Usage:
  
   /usr/sbin/mklivecd [options] &lt;livecd-image&gt;
  
  
General Options:
  
   --help                          Display this message
  
   --version                       Display version information
  
   --verbose                       Be verbose in output
  
   --noclean                       Don't remove temporary files on exit.
  
   --workdir                       Specify a working directory which will not
  
                                   be cleaned.
  
   --debug                         Display some extra debugging information
  
                                   while building the CD. (Useful for bug
  
                                   reports to the developers.)
  
  
Image generation:
  
   --root &lt;rootdir&gt;                Root directory of the live filesystem to use
  
                                   as the for the image of the LiveCD.
  
                                   (default: /)
  
   --tmp &lt;tmpdir&gt;                  Name of the directory to be used for
  
                                   temporary file storage.
  
                                   (default: /tmp)
  
   --img &lt;image&gt;                   Name of the saved compressed image. When an
  
                                   image by this name is found, it will not be
  
                                   re-created or overwritten, rather the
  
                                   existing image will be re-used, i.e. the
  
                                   compressed image is not re-built.
  
   --nofile &lt;ex1&gt;[,][...]          Excludes files from the final image. (Also
  
                                   see the --nodir option for a full
  
                                   description)
  
   --nodir &lt;ex1&gt;[,][...]           Excludes directories from the final image.
  
                                   Patterns passed to this option (as with the
  
                                   --nofile option) should be valid in a grep(1)
  
                                   search, e.g. --nodir=^/home/jaco,^/root/.mcop
  
                                   will exclude both the /home/jaco and
  
                                   /root/.mcop directories from the final
  
                                   LiveCD.
  
   --sort &lt;file&gt;                   Sort the files on the compressed iso image
  
                                   according to the genisoimage-style sort specifier
  
                                   as detailed in file.
  
   --kernel &lt;kernel&gt;               Kernel to use as default for the LiveCD image.
  
                                   (default: 4.9.35-desktop-1.mga6)
  
   --gzip                          Use gzip compression for the image
  
   --xz                            Use xz compression for the image
  
   --nosplash                      Disable the use of boot splash (plymouth)
  
  
Boot options:
  
   --bootopt &lt;option&gt;              Specify an additional boot option to pass to
  
                                   the kernel command-line.
  
   --bootmsg &lt;msg&gt;                 Use 'msg' as the isolinux boot message.
  
   --bootkey &lt;key=msg&gt;             Display 'msg' on key 'key' from isolinux.
  
   --bootimg &lt;img&gt;                 Use 'img' (LSS format) as the isolinux.
  
                                   background display image.
  
   --bootloader &lt;iso|grub|usb&gt;     The bootloader to use on the livecd i.e. isolinux,    
                                   GRUB or syslinux for usb stick
  
   --bootmenu &lt;file&gt;               What boot menu definition file should be used
  
                                   in case that bootloader option is set to iso or grub.
  
                                   For iso this file must be named 'isolinux.cfg',
  
                                   for grub the name must be 'menu.lst'.
  
                                   Boot menu will be generated if not specified.
  
   --bootlang &lt;lang code&gt;          Which language shound be used as default
  
                                   in the boot menu.
  
                                   Defaults to 'en'.
  
   --mbkopt &lt;kernel&gt;               Create the ISO with multi boot kernel option.
  
   --ufs &lt;unionfs|overlayfs&gt;       Specify the union file system. DISABLED (only overlayfs works)
  
   --timeout &lt;sec&gt;                 Specify the default ISO Linux prompt timeout
  
                                   in seconds.
  
                                   (default: 150)
  
   --noprompt                      Disable ISO Linux prompt (i.e. prompt 0).
  
   --keyboard &lt;mapping&gt;            Specify a different keyboard layout as
  
                                   default for the LiveCD.
  
                                   (default: us)
  
   --resolution &lt;res&gt;              Specify the resolution for the framebuffer
  
                                   output device. (Either resolution or normal)
  
                                   (default: 800x600)
  
   --splash &lt;silent|verbose|no&gt;    Create the LiveCD with bootsplash support if
  
                                   available on the root filesystem.
  
                                   (default: silent)
  
   --fstab &lt;options&gt;               Override the default options for the fstab on
  
                                   the LiveCD. Options are one or more of 'auto'
  
                                   and 'rw', for example '--fstab=rw,auto' will
  
                                   automatically mount all detected partitions
  
                                   rw.
  
   --nofinishinstall               Disables the automatic system setup screens on
  
                                   first boot.
  
   --nosyslog                      Disable common logs to speed boot.
  
  
ISO Image options:
  
   --isoextrafiles &lt;path&gt;          Add the files in 'path' to the root of the
  
                                   LiveCD ISO image.
  
   --application &lt;id&gt;              Use the specified iso application ID, as '-A'
  
                                   option to genisoimage.
  
   --volumeid &lt;id&gt;                 Use the specified iso volume ID, as a '-V'
  
                                   option to genisoimage.
  
   --preparer &lt;prep&gt;               Use the specified preparer ID, as a '-p'
  
                                   option to genisoimage.
  
   --publisher &lt;pub&gt;               Use the specified publisher ID, as a '-P'
  
                                   option to genisoimage.
  
   --md5sum                        Compute and implant the md5sum to verify media.
  
   --memtest                       Use memtest86+ to check the system memory.
  
      
Behaviour:
  
   --usbhome                       Use USB memory stick devices as a persistent
  
                                   home when available/connected on bootup.
  
  
Examples:
  
    /usr/sbin/mklivecd --nodir ^/usr/src/RPM,^/root/tmp livecd.iso
  
    /usr/sbin/mklivecd --splash=silent livecd.iso
```
    
