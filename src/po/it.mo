��    "      ,  /   <      �      �  .     W   I  !   �  B   �       �     p   �  4   i  9   �  8   �  G     (   Y  1   �     �  *   �  .   �  7   .  -   f  8   �  Y   �    '     /	     I	     \	     v	     �	     �	     �	     �	  9   �	     
  �  3
  y  �#  $   G%  6   l%  R   �%  8   �%  F   /&     v&  �   �&  u   }'  7   �'  2   +(  9   ^(  C   �(  1   �(  8   )  #   G)  .   k)  4   �)  ;   �)  5   *  <   A*  a   ~*  #  �*      ,     %,  !   >,     `,     z,     �,     �,     �,  B   �,  )   /-  R  Y-                   
            "                                                 !                                          	                                    
Created '%s' (%s bytes) in %s

 
Disabling Services not needed on the LiveCD

 
FATAL: '%s' does not exist on your machine. You need to install the syslinux package.
 
FATAL: Execution of '%s' failed
 
FATAL: Extra ISO directory (--isoextrafiles) '%s' does not exist
 
FATAL: Interrupted.
 
FATAL: Invalid resolution '%s' specified with '--resolution' option
       Valid resolutions are:
             normal
            640x480
            800x600
           1024x768
          1280x1024
          1600x1200
 
FATAL: Kernel (--kernel) '%s' not installed on the root image. (Directory '%s/lib/modules/%s' does not exist.)
 
FATAL: Root directory (--root) '%s' does not exist
 
FATAL: Specified sort file (--sort) '%s' does not exist
 
FATAL: Temporary directory (--tmp) '%s' does not exist
 
FATAL: The kernel '%sboot/vmlinuz-%s' does not exist on your machine.
 
FATAL: Too many command-line arguments
 
FATAL: Unable to create working directory, '%s'
 
FATAL: Unable to execute '%s'
 
FATAL: Unable to execute 'implantisomd5'
 
FATAL: Unknown splash (--splash) option '%s'
 
FATAL: Work directory (--workdir) '%s' does not exist
 
Restoring Services on the installed system

 
The LiveCD kernel and multi boot kernel are identical.
 
WARNING: The temporary directory '%s' will not be removed at exit, please do so manually %s, version %s, %s
%s

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.
 Creating %s and %s initrd Creating %s initrd Creating compressed image Creating final iso Creating initrd Creating isolinux boot Creating loop image Embedding MD5 checksum Please choose another kernel or use the --kernel option.
 Setting filesystem parameters Usage:
   %s [options] <livecd-image>

General Options:
   --help                          Display this message
   --version                       Display version information
   --verbose                       Be verbose in output
   --noclean                       Don't remove temporary files on exit.
   --workdir                       Specify a working directory which will not
                                   be cleaned.
   --debug                         Display some extra debugging information
                                   while building the CD. (Useful for bug
                                   reports to the developers.)

Image generation:
   --root <rootdir>                Root directory of the live filesystem to use
                                   as the for the image of the LiveCD.
                                   (default: %s)
   --tmp <tmpdir>                  Name of the directory to be used for
                                   temporary file storage.
                                   (default: %s)
   --img <image>                   Name of the saved compressed image. When an
                                   image by this name is found, it will not be
                                   re-created or overwritten, rather the
                                   existing image will be re-used, i.e. the
                                   compressed image is not re-built.
   --nofile <ex1>[,][...]          Excludes files from the final image. (Also
                                   see the --nodir option for a full
                                   description)
   --nodir <ex1>[,][...]           Excludes directories from the final image.
                                   Patterns passed to this option (as with the
                                   --nofile option) should be valid in a grep(1)
                                   search, e.g. --nodir=^/home/jaco,^/root/.mcop
                                   will exclude both the /home/jaco and
                                   /root/.mcop directories from the final
                                   LiveCD.
   --sort <file>                   Sort the files on the compressed iso image
                                   according to the genisoimage-style sort specifier
                                   as detailed in file.
   --kernel <kernel>               Kernel to use as default for the LiveCD image.
                                   (default: %s)
   --lzma                          Use lzma compression for the image
   --nosplash                      Disable the use of boot splash (plymouth)

Boot options:
   --bootopt <option>              Specify an additional boot option to pass to
                                   the kernel command-line.
   --bootmsg <msg>                 Use 'msg' as the isolinux boot message.
   --bootkey <key=msg>             Display 'msg' on key 'key' from isolinux.
   --bootimg <img>                 Use 'img' (LSS format) as the isolinux.
                                   background display image.
   --bootloader <iso|grub|usb>     The bootloader to use on the livecd i.e. isolinux, 
                                   GRUB or syslinux for usb stick
   --bootmenu <file>               What boot menu definition file should be used
                                   in case that bootloader option is set to iso or grub.
                                   For iso this file must be named 'isolinux.cfg',
                                   for grub the name must be 'menu.lst'.
                                   Boot menu will be generated if not specified.
   --boottheme <name>              Which gfxboot theme should be used.
                                   Defaults to 'Unity-Linux'
   --bootlang <lang code>          Which language shound be used as default
                                   in the boot menu.
                                   Defaults to 'en'.
   --mbkopt <kernel>               Create the ISO with multi boot kernel option.
   --ufs <unionfs|aufs>            Specify the union file system. DISABLED (only aufs works)
   --timeout <sec>                 Specify the default ISO Linux prompt timeout
                                   in seconds.
                                   (default: %s)
   --noprompt                      Disable ISO Linux prompt (i.e. prompt 0).
   --keyboard <mapping>            Specify a different keyboard layout as
                                   default for the LiveCD.
                                   (default: %s)
   --resolution <res>              Specify the resolution for the framebuffer
                                   output device. (Either resolution or normal)
                                   (default: %s)
   --splash <silent|verbose|no>    Create the LiveCD with bootsplash support if
                                   available on the root filesystem.
                                   (default: %s)
   --fstab <options>               Override the default options for the fstab on
                                   the LiveCD. Options are one or more of 'auto'
                                   and 'rw', for example '--fstab=rw,auto' will
                                   automatically mount all detected partitions
                                   rw.
   --nofinishinstall               Disables the automatic system setup screens on
                                   first boot.
   --nosyslog                      Disable common logs to speed boot.

ISO Image options:
   --isoextrafiles <path>          Add the files in 'path' to the root of the
                                   LiveCD ISO image.
   --application <id>              Use the specified iso application ID, as '-A'
                                   option to genisoimage.
   --volumeid <id>                 Use the specified iso volume ID, as a '-V'
                                   option to genisoimage.
   --preparer <prep>               Use the specified preparer ID, as a '-p'
                                   option to genisoimage.
   --publisher <pub>               Use the specified publisher ID, as a '-P'
                                   option to genisoimage.
   --md5sum                        Compute and implant the md5sum to verify media.
   
Behaviour:
   --usbhome                       Use USB memory stick devices as a persistent
                                   home when available/connected on bootup.

Examples:
    %s --nodir ^/usr/src/RPM,^/root/tmp livecd.iso
    %s --splash=silent livecd.iso

 Project-Id-Version: 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2011-02-02 00:08+0100
PO-Revision-Date: 2011-01-31 00:36+0200
Last-Translator: Alessio <alessio.adamo@unity-linux.org>
Language-Team: ITALIAN
Language: it
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
X-Generator: Pootle 2.1.5
 
Creata l'iso "%s" (%s byte) in %s

 
Disabilitazione di servizi non necessari sul LiveCD

 
FATALE: "%s" non c'è sulla tua macchina. Devi installare il pacchetto syslinux.
 
FATALE: L'esecuzione di "%s" non è andata a buon fine
 
FATALE: La directory extra dell'ISO (--isoextrafiles) "%s" non esite
 
FATALE: Interrotto
 
FATALE: Con l'opzione "--resolution" è stata specificata una risoluzione invalida "%s"
       Risoluzioni valide sono:
            normale
            640x480
            800x600
           1024x768
          1280x1024
          1600x1200
 
FATALE: Il kernel (--kernel) "%s" non è installato nella root image. (La directory "%s/lib/modules/%s" non esiste)
 
FATALE: La directory di root (--root) "%s" non esiste
 
FATALE: Il file di sort (--sort) "%s" non esiste
 
FATALE: La directory temporanea (--tmp) "%s" non esiste
 
FATAL: Il kernel "%sboot/vmlinuz-%s" non c'è sulla tua macchina.
 
FATALE: Troppi argomenti sulla linea di comando
 
FATALE: Impossibile creare la directory di lavoro "%s"
 
FATALE: Impossibile eseguire "%s"
 
FATALE: Impossibile eseguire "implantisomd5"
 
FATALE: opzione splash (--splash) "%s" sconosciuta
 
FATAL: La directory di lavoro (--workdir) "%s" non esiste
 
Ripristino dei servizi dell'installazione corrente

 
Il kernel del LiveCD e il kernel multi boot sono identici.
 
AVVISO: La directory temporanea "%s" non sarà rimossa all'uscita, si prega di farlo manualmente %s, versione %s, %s
%s

Questo programma è software libero; puoi redistribuirlo e/o
modificarlo entro i termini della GNU General Public License
così come pubblicati dalla Free Software Foundation; o la
versione 2 della licenza, o (a propria discrezione) una
qualsiasi versione superiore.
 Creazione di %s e dell'initrd %s Creazione dell'initrd %s Creazione dell'immagine compressa Creazione dell'iso finale Creazione dell'initrd Creazione del boot isolinux Creazione dell'immagine di loop Incorporazione del checksum MD5 Si prega di scegliere un altro kernel o usare l'opzione --kernel.
 Impostazione dei parametri del filesystem Uso:
   %s [opzioni] <immagine-livecd>

Opzioni generali:
   --help                          Mostra questo messaggio.
   --version                       Mostra le informazioni di versione.
   --verbose                       Output verboso.
   --noclean                       Non elimina i file temporanei una volta terminato.
   --workdir                       Specifica una directory di lavoro che non sarà
                                   pulita.
   --debug                         Mostra informazioni extra per il debug
                                   durante la generazione del CD (utile per la
                                   segnalazione di bug agli sviluppatori).

Generazione dell'immagine:
   --root <rootdir>                Directory di root che il filesystem live deve usare
                                   per l'immagine del LiveCD.
                                   (predefinita: %s)
   --tmp <tmpdir>                  Nome della directory da usare per la memorizzazione
                                   dei file temporanei.
                                   (predefinita: %s)
   --img <immagine>                Nome dell'immagine compressa salvata. Quando
                                   viene trovata un'immagine con lo stesso nome, non
                                   sarà ricreata o sovrascritta, piuttosto l'immagine
                                   esistente sarà riutilizzata.
   --nofile <ex1>[,][...]          Esclude i file specificati dall'immagine finale
                                   (vedi anche l'opzione --nodir per una descrizione
                                   completa).
   --nodir <ex1>[,][...]           Esclude le directory specificate dall'immagine
                                   finale. I pattern passati a questa opzione (così
                                   come per l'opzione --nofile) devono essere validi
                                   per una ricerca con grep(1). Per esempio:
                                   --nodir=^/home/jaco,^/root/.mcop
                                   escluderà dal LiveCD finale sia la directory
                                   /home/jaco che la directory /root/.mcop
   --sort <file>                   Ordina i file sull'immagine iso compressa secondo
                                   le specifiche di ordinamento in stile genisoimage
                                   dettagliate nel file specificato.
   --kernel <kernel>               Kernel da usare come predefinito per l'immagine
                                   LiveCD.
                                   (predefinito: %s)
   --lzma                          Usa la compressione lzma per l'immagine.
   --nosplash                      Disabilita l'uso del boot splash (plymouth).

Opzioni del boot:
   --bootopt <opzione>             Specifica un'opzione del boot aggiuntiva da passare
                                   alla linea di comando del kernel.
   --bootmsg <msg>                 Usa "msg" come messaggio di boot per isolinux.
   --bootkey <key=msg>             Visualizza "msg" sul tasto 'key' da isolinux.
   --bootimg <immagine>            Usa "immagine" (formato LSS) come immagine di
                                   sfondo per isolinux.
   --bootloader <iso|grub|usb>     Il bootloader da usare sul livecd, ovvero isolinux, 
                                   GRUB o syslinux per chiavette usb.
   --bootmenu <file>               Quale file di definizione del menu d'avvio deve
                                   essere usato nel caso in cui l'opzione bootloader sia
                                   impostata ad iso o grub. Per iso questo file deve
                                   essere denominato "isolinux.cfg", per grub il nome
                                   deve essere "menu.lst".
                                   Il menu d'avvio sarà generato se non specificato.
   --boottheme <nome>              Quale tema grafico deve essere usato.
                                   Predefinito è "Unity-Linux"
   --bootlang <cod. lingua>        Quale lingua deve essere usata come predefinita
                                   nel menù di avvio.
                                   Predefinita è "en".
   --mbkopt <kernel>               Crea l'ISO con la possibilità di avere più kernel.
   --ufs <unionfs|aufs>            Specifica il filesystem union. DISABILITATA (funziona
                                   solo aufs)
   --timeout <sec>                 Specifica in secondi il tempo d'attesa predefinito di
                                   ISO Linux per effettuare una scelta.
                                   (predefinito: %s)
   --noprompt                      Disabilita il prompt di ISO Linux (ovvero prompt 0).
   --keyboard <mappatura>          Specifica un diverso layout della tastiera come
                                   predefinito per il LiveCD.
                                   (predefinita: %s)
   --resolution <res>              Specify the resolution for the framebuffer
                                   output device. (Either resolution or normal)
                                   (predefinito: %s)
   --splash <silent|verbose|no>    Crea un LiveCD con supporto del bootsplash se
                                   disponibile nel filesystem di root.
                                   (predefinito: %s)
   --fstab <opzioni>               Non tiene conto delle opzioni predefinite di
                                   fstab sul LiveCD. Per esempio "--fstab=rw,auto"
                                   monterà automaticamente tutte le partizioni rilevate
                                   in modalità rw.
   --nofinishinstall               disabilita le schermate automatiche di configurazione
                                   del sistema al primo avvio.
   --nosyslog                      Disabilita i log per velocizzare l'avvio.

Opzioni per l'immagine ISO:
   --isoextrafiles <percorso>      Aggiunge i file in "percorso" alla root dell'immagine
                                   ISO del LiveCD.
   --application <id>              Usa l'iso application ID specificato, analogo 
                                   all'opzione '-A' di genisoimage.
   --volumeid <id>                 Usa l'iso volume ID specificato, analogo 
                                   all'opzione '-V' di genisoimage.
   --preparer <prep>               Usa il preparer ID specificato, analogo
                                   all'opzione '-p' di genisoimage.
   --publisher <pub>               Usa il publisher ID specificato, analogo
                                   all'opzione '-P' di genisoimage.
   --md5sum                        Computa e impianta la md5sum per verificare il supporto.
   
Comportamento:
   --usbhome                       Usa chiavette USB come home persistente quando
                                   disponibili/connessi all'avvio.

Esempi:
    %s --nodir ^/usr/src/RPM,^/root/tmp livecd.iso
    %s --splash=silent livecd.iso

 