############DEFINES############
USER=Your_SYSDBA_or_power_user
PASSWORD=the_user_password

TNS_ADMIN=/home/oracle/app/oracle/product/11.2.0/dbhome_1/network/admin
export TNS_ADMIN

ORACLE_HOME=/home/oracle/app/oracle/product/11.2.0/dbhome_1
export ORACLE_HOME

ORACLE_HOME_LISTNER=$ORACLE_HOME
export ORACLE_HOME_LISTNER
################################

#start listener
lsnrctl start


SERVICIOSORACLE=$(cat /etc/oratab | grep -v "#" | sed '/^\s*$/d' | cut -d: -f1)

for SERVICIO in $SERVICIOSORACLE
do

echo "------------------------Starting service $SERVICIO------------------------------"

ORACLE_SID=$SERVICIO
export ORACLE_SID
sqlplus $USER/$PASSWORD as sysdba <<< startup

done

echo "done"
