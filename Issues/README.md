### Bug 13361 - Building Out-of-Tree Modules on the BBB Target using optional YOCTO package kernel-headers 

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13361#c0

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
