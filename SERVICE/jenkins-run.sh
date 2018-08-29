echo "停止服务"
sudo service SERVICE stop

sleep 2

echo "备份当前版本"
mv /projects/SERVICE/jar/SERVICE.jar /projects/SERVICE/backup/SERVICE.jar.`date +"%Y-%m-%d-%H%M%S"`
cp  /projects/SERVICE/tmp/SERVICE.jar /projects/SERVICE/jar

echo "启动服务"
chmod +x /projects/SERVICE/jar/SERVICE.jar

sudo service SERVICE start
