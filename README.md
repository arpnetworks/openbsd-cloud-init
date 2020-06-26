OpenBSD initialization for cloud environments
=============================================

Overview
--------

**This repo is dead.**

You can just install cloud-init on OpenBSD like this::

  git clone https://github.com/canonical/cloud-init.git
  cd cloud-init
  tools/build-on-openbsd

Then, incorporate the following into your startup scripts::

  # After disks are mounted
  cloud-init init --local

  # After network has run
  cloud-init init

  cloud-init modules --mode config
  cloud-init modules --mode final

Overview (OLD)
--------------

[![Build
Status](https://travis-ci.org/arpnetworks/openbsd-cloud-init.svg?branch=master)](https://travis-ci.org/arpnetworks/openbsd-cloud-init)

~~Despite [cloud-init](https://github.com/canonical/cloud-init) claiming
that OpenBSD is supported, I've never seen a version of cloud-init for
[OpenBSD](http://www.openbsd.org) no matter where I looked.

There is an independent, and also minimal, one [by
exoscale](https://github.com/exoscale/openbsd-cloud-init), but that's
about it.

At [ARP Networks](https://arpnetworks.com), we provision new VMs with
cloud-init using the config-disk method (NoCloud), so in order to keep
with our commitment to support the *BSDs, we've created these minimal
scripts that will take our cloud-init config-disk images and instantiate
a full OpenBSD VM from it.~~

Copyright
---------

Copyright (c) 2020 [ARP Networks, Inc.](https://arpnetworks.com)
