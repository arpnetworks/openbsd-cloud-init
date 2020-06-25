=============================================
OpenBSD initialization for cloud environments
=============================================

Overview
--------

Despite [cloud-init](https://github.com/canonical/cloud-init) claiming
that OpenBSD is supported, I've never seen a version of cloud-init for
[OpenBSD](http://www.openbsd.org).

At [ARP Networks](https://arpnetworks.com), we provision new VMs with
cloud-init, so in order to keep with our commitment to support the
*BSDs, we've created these minimal scripts that will take our cloud-init
config-disk images and instantiate a full VM from it.

Copyright
---------

Copyright (c) 2020 [ARP Networks, Inc.](https://arpnetworks.com)
