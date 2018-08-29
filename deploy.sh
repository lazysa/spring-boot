#!/bin/sh
# Spring boot 模板批量替换脚本

#if [ $# -ne 3 ]; then
#   echo -e "$0 Usage: <service_env> <service_name> <service_port> \n eg: $0 test front-api 10080" 
#   exit 2;
#fi

read -p "Enter a env name: eg: test " envName
read -p "Enter a service name: eg: job-api " serviceName
read -p "Enter a service port: eg: 10080 " servicePort

#envName=$1
#serviceName=$2
#servicePort=$3
modeName='SERVICE'

# 复制目录结构模板
cp -ar $modeName $serviceName
cd $serviceName/jar &&  mv SERVICE.conf $serviceName.conf 
modeConf="jar/$serviceName.conf"
runConf="jenkins-run.sh"

# 修改部署环境名和端口号
sed -i "s/\(--spring.profiles.active\)=ENV/\1=$envName/" ../$modeConf
sed -i "s/\(--server.port\)=PORT/\1=$servicePort/" ../$modeConf

sed -i "s/SERVICE/$serviceName/g" ../$runConf 
ln -s /projects/$serviceName/jar/${serviceName}.jar /etc/rc.d/init.d/$serviceName 
