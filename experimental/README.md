### Rationale behind the final decision how to use systemd YOCTO local.conf
https://github.com/ZoranStojsavljevic/bbb-yocto/blob/master/experimental/local.conf_core-tools-profile

From: Zoran Stojsavljevic <zoran.stojsavljevic@gmail.com>
Date: Tue, Jun 4, 2019 at 11:34 PM
Subject: Fwd: [yocto] Potential (?) systemd YOCTO problems
To: Yocto Project <yocto@yoctoproject.org>, <morne@linux.com>
Cc: Khem Raj <raj.khem@gmail.com>, Scott Rifenbark <srifenbark@gmail.com>

> I would have a look at the values of
> DISTRO_FEATURES_BACKFILL_CONSIDERED as well as
> VIRTUAL-RUNTIME_initscripts.
>
> My understanding is that if the former is set to
> "sysvinit", it causes any redundant SysVinit
> scripts to be removed, and further, that if the
> latter is set to "", then all initscripts are
> removed from the image altogether.

I would like to thank you for the advice. I tried several combinations
without any success, and at the end I came up exactly what you have
suggested to me.

Local.conf looks something like this:
https://github.com/ZoranStojsavljevic/bbb-yocto/blob/master/experimental/local.conf_core-tools-profile

And the latest changes committed which I have tried following your
suggestion are:
https://github.com/ZoranStojsavljevic/bbb-yocto/commit/83c22e8ec516020206dc1b34e93276cca8f3f16b

I need to do more tests... But seems that initial tests show that all
scripts are in place, and systemd is used.

This also should be much better documented somewhere in YOCTO
documentation. My best guess (I did not find it anywhere in the
manuals, maybe I missed the paragraph - please, advice where it is?).

Thank you again,
Zoran
_______

On Mon, Jun 3, 2019 at 9:07 PM Morné Lamprecht <morne@linux.com> wrote:
>
> On Mon, Jun 03, 2019 at 07:38:47PM +0200, Zoran Stojsavljevic wrote:
> >Still. I expected to see the following on the
> >target (my BBB): /etc/init.d/networking script,
>
> I would have a look at the values of
> DISTRO_FEATURES_BACKFILL_CONSIDERED as well as
> VIRTUAL-RUNTIME_initscripts.
>
> My understanding is that if the former is set to
> "sysvinit", it causes any redundant SysVinit
> scripts to be removed, and further, that if the
> latter is set to "", then all initscripts are
> removed from the image altogether.
>
>                 - Morné
> --
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto
