echo "$(date)" >> executor.log
echo $AMX_RECEIVER >> executor.log
echo $AMX_STATUS >> executor.log
echo $AMX_EXTERNAL_URL >> executor.log
echo $AMX_LABEL_alertname >>executor.log
echo "AMX_LABEL_instance "$AMX_LABEL_instance >> executor.log
Instance=$(echo $AMX_LABEL_instance| cut -f1 -d":")
echo "start execution started"

if [[ "$AMX_LABEL_alertname" == "example-alert" ]];
then
  #write your code here. ie: You need to delete some files to clear disk space or restart the instance
   echo "in if condition *************************"
	
else
	echo "Label is different, ${AMX_LABEL_alertname}" >> executor.log

fi
