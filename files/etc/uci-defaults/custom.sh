#!/bin/sh

#设置默认防火墙规则，方便虚拟机首次访问WebUI
uci 设置防火墙。@zone[1].input = '接受'设置防火墙.@zone[1] .input = 'ACCEPT'

#设置主机名地图，解决安卓电视无法联网的问题
uci 添加 dhcp 域
uci 设置“dhcp.@domain[-1] .name =time.android.com” 设置“dhcp.@domain[-1] .name =time.android.com”
uci 设置“dhcp.@domain[-1] .ip = 203 .107.6.88”设置“dhcp.@domain[-1] .ip = 203 .107.6.88”


#根据网络退款数量配置
统计 = 00
for对于 /sys/class/net/* 中的 iface；做in /sys/class/net/*;做
  iface_name =$(基本名称“ $iface ”) iface_name =$(基本名称" $iface " )
  #检查是否为物理端口（排除回环设备和无线设备）#检查是否为物理端口（排除回环设备和无线设备）
  if [ -e  " $iface /device" ] && echo " $iface_name " | grep -Eq   '^eth|^en' ;然后if [ -e    " $iface /device" ] && echo " $iface_name " | grep -Eq     '^eth|^en' ;然后
    计数=$((计数+1))计数=$((计数+1))
  菲菲
完毕

# 网络设置
if如果[“ $count ” -eq   1 ];然后“ $count ”    -eq   1 ];然后
  uci 设置network.lan .proto = 'dhcp'设置network.lan .proto = 'dhcp'
elifelif [“ $count ”-gt 1 ];然后$count ”   -gt    1 ]；然后
  uci 设置网络.lan.ipaddr ='192.168.1.1'
菲

# 设置所有网口可访问网页终端
uci 删除 ttyd.@ttyd[0].interface

#设置所有网口可连接SSH
uci 设置 dropbear.@dropbear[0] .Interface = ''
uci提交

# 设置编译作者信息
FILE_PATH =“/etc/openwrt_release”
新描述="由悟空日报编译"
sed -i  “s /DISTRIB_DESCRIPTION = '[^' ]* '/DISTRIB_DESCRIPTION='   $NEW_DESCRIPTION   '/” “ $FILE_PATH ”

出口0
