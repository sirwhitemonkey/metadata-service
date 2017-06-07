#!/bin/sh
# Settings - main
export service_module=/service/metadata-service.jar
export service_log=/service/server.log

case "$1" in
		start)
		exec java -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m -XX:+UseConcMarkSweepGC -Xms1024m -Xmx1024m -XX:-UseGCOverheadLimit -Xss512k -XX:NewRatio=3 -jar "$service_module" > "$service_log"
		;;
		stop)
		pkill -f "metadata-service.jar"
		;;
		log)
		tail -f server.log
		;;
		*)
		echo "Usage: {start|stop|log}"
		;;
esac
		
