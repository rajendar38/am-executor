#!/bin/bash
set -euo pipefail
echo "$(date)" 
echo $AMX_RECEIVER 
echo $AMX_STATUS 
echo $AMX_EXTERNAL_URL 
echo $AMX_LABEL_alertname 
#echo $AMX_LABEL_instance 
#echo $AMX_ALERT_${1}_LABEL_instance
#echo $AMX_ALERT_${2}_LABEL_instance
echo "length ====================" $AMX_ALERT_LEN
echo "======================================="


main() {
  for i in $(seq 1 "$AMX_ALERT_LEN"); do
    ref="AMX_ALERT_${i}_LABEL_instance"
    echo "$(echo "${!ref}" | cut -d: -f1)"   
   
  done
  wait
}

main "$@"
