# main
MAIN_JAR=com.them.homepage.jar
API_HOME=/home/centos/hompage


PID=`ps -ef | egrep $MAIN_JAR | egrep -v 'vi|tail|grep' | awk '{print $2;}'`

start() {
        if [[ $PID ]] ; then
                ps -ef | egrep $MAIN_JAR | egrep -v 'vi|tail|grep'
                echo "already started."
        else
                echo "start process..."
                java -jar $MAIN_JAR  &
                ps -ef | egrep $MAIN_JAR | egrep -v 'vi|tail|grep'
        fi
}

stop() {
        if [[ $PID ]] ; then
                ps -ef | egrep $MAIN_JAR | egrep -v 'vi|tail|grep'
                kill $PID
                echo "stop process."
        else
                echo "not running."
        fi
}

restart() {
        stop
        sleep 5
        echo "start process..."
        java -jar $MAIN_JAR  &
        ps -ef | egrep $MAIN_JAR | egrep -v 'vi|tail|grep'
}

status() {
        if ps -ef | egrep $MAIN_JAR | egrep -v 'vi|tail|grep'
        then
                echo "running.."
        else
                echo "not running."
        fi
}

# See how we were called.
case "$1" in
    start)
        start
         ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
        show)
        show
        ;;
    *)
        status
        ;;
esac
