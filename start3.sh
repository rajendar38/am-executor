#!/bin/bash
set -euo pipefail
echo "$(date)" 
echo $AMX_RECEIVER 
echo $AMX_STATUS 
echo $AMX_EXTERNAL_URL 
echo $AMX_LABEL_alertname 
echo "AMX_LABEL_instance" $AMX_LABEL_instance 
echo $AMX_ALERT_${1}_LABEL_instance
echo $AMX_ALERT_LEN
