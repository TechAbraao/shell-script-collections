#!/bin/bash

FILE_NAME=data.csv
URL=http://127.0.0.1:8000/api/projects

count=1
while IFS=',' read -r csv_message csv_status; do

    status_code=$(curl -X POST \
        "$URL" \
            -H "Content-Type: application/json" \
            -H "Accept: application/json" \
            -d "{ \"message\": \"$csv_message\", \"status\": \"$csv_status\" }" \
            -o /dev/null \
            -w "%{http_code}" \
            -s)
         
        logs_msgs=" [$count] | status_code: $status_code | body_sent={'csv_message': '$csv_message', 'csv_status': '$csv_status'}" 
        echo $logs_msgs >> requests_history.log

    ((count++))
done < "$FILE_NAME"