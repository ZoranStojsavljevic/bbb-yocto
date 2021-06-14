### Bug 13360 - kernel-dev: package full kernel source and headers for reference purposes

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13360

        It seems that my bugzilla entry 13361 is duplicate of 13360. I apologize for that. I did not
        spot this one, although I searched the entries. My bad.

        @13360:

        It is simple impossible what you have wrote here. If you use minimalistic kernel with all source
        code in it. it is impossible that the same header tree would be 2x bigger.

        I did explicit investigation about my latest host (HP Elite Book 840-G1) where I have dual-boot
        system (WIN10 and Fedora 29) F29 kernel, and results are speaking for themselves (obviously
        opposing your statements).

        Here is what my F29 5.0.17 kernel headers are in size (installed):
        [user@fedora29-ssd 5.0.17-200.fc29.x86_64]$ pwd
        /usr/src/kernels/5.0.17-200.fc29.x86_64
        [user@fedora29-ssd 5.0.17-200.fc29.x86_64]$ du --summarize 
        102124	.
        [user@fedora29-ssd 5.0.17-200.fc29.x86_64]$

        And here is what the size of the whole kernel, compressed is:
        https://rpmfind.net/linux/RPM/fedora/updates/29/x86_64/Packages/k/kernel-5.0.17-200.fc29.x86_64.html

        You can download it, unpack, and see how big it is!
        Here is just the basic kernel source in .xz format (I did not include patches and support shell
        files, after unpacking):
        [vuser@fedora29-ssd kernel.fedora]$ pwd
        /home/vuser/projects/kernel.fedora
        [vuser@fedora29-ssd kernel.fedora]$ ls -al linux-5.0.tar.xz
        -rw-rw-r--. 1 vuser vboxusers 105235152 Mar  4 15:57 linux-5.0.tar.xz
        [vuser@fedora29-ssd kernel.fedora]$

        I unpacked it, to see/experience for myself:
        [vuser@fedora29-ssd linux-5.0]$ pwd
        /home/vuser/projects/kernel.fedora/linux-5.0
        [vuser@fedora29-ssd linux-5.0]$ du --summarize 
        955756	.
        [vuser@fedora29-ssd linux-5.0]$

        I hope this clears the confusion.

### Bug 13361 - Building Out-of-Tree Modules on the BBB Target using optional YOCTO package kernel-headers 

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13361

The problem summation:

        Zoran Stojsavljevic 2019-05-26 03:41:37 UTC

        ---------- Forwarded message ---------
        From: Khem Raj <raj.khem@gmail.com>
        Date: Fri, May 24, 2019 at 3:00 AM
        Subject: Re: [yocto] Building Out-of-Tree Modules on the BBB Target
        To: Zoran Stojsavljevic <zoran.stojsavljevic@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
        Cc: Yocto Project <yocto@yoctoproject.org>

        I think this is a fair suggestion. Having prebuilt kernel available that contains the configuration
        and header files used in the build is all that is required for external modules to build in addition
        to toolchain, so maybe its worth a try to create such a package and then have kernel-source
        separated out which can be installed on top if one needs.
        _______

        The rationale to add kernel-headers package is the image footprint. Still, as empirically measured
        by me, kernel-headers package will add ~ 7x to 9x reduction in size to image comparing to
        kernel-devsrc package. Having BBB's DDR2 of size 512MB, and initramfs for testing purposes, it
        speaks for itself.

        Me (Zoran) opened this one just to track progress of this work by Bruce Ashfield.

        Thank you,
        Zoran Stojsavljevic
