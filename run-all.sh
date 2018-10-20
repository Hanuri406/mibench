#!/bin/sh

# A script to run all the MiBench tests for an embedded target.

# Copyright 2012 Embecosm Limted

# Contributed by Jeremy Bennett <jeremy.bennett@embecosm.com>

# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation; either version 3 of the License, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
# more details.

# You should have received a copy of the GNU General Public License along with
# this program; if not, write to the Free Software Foundation, Inc., 51
# Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.

#srcdirs="automotive consumer network office security telecomm"
srcdirs="automotive/basicmath
         automotive/bitcount
         automotive/qsort
         automotive/susan"
srcdirs="automotive/basicmath"

currdir=$(pwd)

export CC="$RISCV/bin/riscv64-unknown-elf-gcc"
#export RUNIT="spike-wrapper-traces.sh $currdir/traces"
export RUNIT=spike-wrapper.sh

for d in ${srcdirs}
do
    echo ${d}
    cd ${d}
    ./run-all.sh
    cd ..
done
