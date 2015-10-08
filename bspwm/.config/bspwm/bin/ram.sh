#!/bin/bash
meminfo=$(</proc/meminfo)
meminfo=$(echo $(echo $(meminfo=${meminfo// /}; echo ${meminfo//kB/})))
for entry in $meminfo; do
	if [[ ${entry//:*} = MemTotal ]]; then
		memtotal=${entry//*:}
	fi
	
	if [[ ${entry//:*} = MemFree ]]; then
		memfree=${entry//*:}
	fi
	
	if [[ ${entry//:*} = Buffers ]]; then
		membuffer=${entry//*:}
	fi
	
	if [[ ${entry//:*} = Cached ]]; then
		memcached=${entry//*:}
	fi
done
echo $((($memtotal-$memfree-$membuffer-$memcached)/1024))
