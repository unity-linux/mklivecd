# mklivecd: 
has a long and sorted history. It currently lives on in a different
form called mylivecd which was forked for PCLinuxOS. I have decided to 
revive the old version that had been maintained by Unity-Linux until it 
went defunct. mklivecd comes from Mandrake and was dependant on drakxtools.
Newer innerations of Mandrake ie. OpenMandriva no longer depend on these
tools or even use them, however a fork from Mandriva called Mageia that
still uses drakxtools can still utilize this tool. Eventually the
dependacy on drakxtools should be dropped and this tool should be able
to be used on OpenMandriva, Fedora and Mageia as features in dracut should
allow it. However, until then it's current focus will be for functionality
on Mageia.

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
