#!/system/bin/sh
# Copyright (c) 2009-2012, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

target=`getprop ro.board.platform`

chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
chown -h system /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy

emmc_boot=`getprop ro.boot.emmc`
case "$emmc_boot"
    in "true")
        chown -h system /sys/devices/platform/rs300000a7.65536/force_sync
        chown -h system /sys/devices/platform/rs300000a7.65536/sync_sts
        chown -h system /sys/devices/platform/rs300100a7.65536/force_sync
        chown -h system /sys/devices/platform/rs300100a7.65536/sync_sts
    ;;
esac

case "$target" in
    "msm8960" )
        echo 10 > /sys/devices/platform/msm_sdcc.3/idle_timeout
        ;;
esac

# Post-setup services
case "$target" in
    "msm8960")
        soc_id=`cat /sys/devices/system/soc/soc0/id`
        case "$soc_id" in
             "153") #8064 v2
                 start thermal-engine
             ;;

	     *) #all targets except 8064 v2
		 start thermald
	     ;;
        esac
    ;;
esac

case "$target" in
    "msm8960" )
        start mpdecision
    ;;
esac

# io tweak
echo 0 > /sys/block/mmcblk0/queue/add_random
echo 0 > /sys/block/mmcblk0/queue/iostats
# decrease gpu vdd levels
echo -e "900\n980\n1100\n" > /sys/devices/system/cpu/cpu0/cpufreq/gpu_mv_table
# decrease cpu vdd levels
echo "192000 850000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "384000 875000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "486000 875000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "594000 875000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "702000 875000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "810000 885000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "918000 900000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1026000 925000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1134000 950000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1242000 975000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1350000 1000000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1458000 1025000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1566000 1050000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1674000 1075000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels
echo "1728000 1100000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels

