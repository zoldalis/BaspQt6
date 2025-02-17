#!/usr/bin/env bash

#############################################################################
##
## Copyright (C) 2022 The Qt Company Ltd.
## Contact: https://www.qt.io/licensing/
##
## This file is part of the provisioning scripts of the Qt Toolkit.
##
## $QT_BEGIN_LICENSE:LGPL$
## Commercial License Usage
## Licensees holding valid commercial Qt licenses may use this file in
## accordance with the commercial license agreement provided with the
## Software or, alternatively, in accordance with the terms contained in
## a written agreement between you and The Qt Company. For licensing terms
## and conditions see https://www.qt.io/terms-conditions. For further
## information use the contact form at https://www.qt.io/contact-us.
##
## GNU Lesser General Public License Usage
## Alternatively, this file may be used under the terms of the GNU Lesser
## General Public License version 3 as published by the Free Software
## Foundation and appearing in the file LICENSE.LGPL3 included in the
## packaging of this file. Please review the following information to
## ensure the GNU Lesser General Public License version 3 requirements
## will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
##
## GNU General Public License Usage
## Alternatively, this file may be used under the terms of the GNU
## General Public License version 2.0 or (at your option) the GNU General
## Public license version 3 or any later version approved by the KDE Free
## Qt Foundation. The licenses are as published by the Free Software
## Foundation and appearing in the file LICENSE.GPL2 and LICENSE.GPL3
## included in the packaging of this file. Please review the following
## information to ensure the GNU General Public License requirements will
## be met: https://www.gnu.org/licenses/gpl-2.0.html and
## https://www.gnu.org/licenses/gpl-3.0.html.
##
## $QT_END_LICENSE$
##
#############################################################################

set -ex

sudo curl http://repo-clones.ci.qt.io:8081/tools/rmt-client-setup --output rmt-client-setup
sudo chmod 755 rmt-client-setup
sudo SUSEConnect --cleanup
sudo sh rmt-client-setup https://repo-clones.ci.qt.io:8082 --yes --fingerprint 80:90:7F:45:C6:DF:45:8A:57:25:1E:17:5E:D7:E3:6E:96:1B:1B:95

# Activate these modules
sudo SUSEConnect -p sle-module-basesystem/15.4/x86_64
sudo SUSEConnect -p sle-module-server-applications/15.4/x86_64
sudo SUSEConnect -p sle-module-desktop-applications/15.4/x86_64
sudo SUSEConnect -p sle-module-development-tools/15.4/x86_64
sudo SUSEConnect -p sle-module-python3/15.4/x86_64

sudo zypper lr -u

sudo rm -f /tmp/suse_rk.sh
