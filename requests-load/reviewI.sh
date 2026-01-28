#!/bin/bash


while true
do
  read -p "Enter the URL for the HTTP requests: " url
  read -p "Enter the HTTP method: " method

  if [ "$method" = "GET" ]; then
    status=$(curl -o /dev/null -s -w "%{http_code}" "$url")
    echo "Status Code: $status"

  elif [ "$method" = "POST" ]; then
    read -p "Enter the name of the .csv file (including .csv): " file_name

    count=1

    tail -n +2 "$file_name" | while IFS=',' read -r message status
    do
      status=$(curl -o /dev/null -s -w "%{http_code}" \
        -X POST "$url" \
        -H "Content-Type: application/json" \
        -d "{
          \"message\": \"$message\",
		      \"status\": \"$status\"
        }"
      )

      if [ "$status" -eq 200 ]; then
        echo " [$count] Message: Created | Status Code: $status"

      elif [ "$status" -eq 403 ]; then
        echo " [$count] Message: Forbidden | Status Code: $status"
	
	    elif [ "$status" -eq 400 ]; then
        echo " [$count] Message: Bad Request | Status Code: $status"
		
      else
        echo " [$count] Message: Unknown error | Status Code: $status"
      fi

      count=$((count + 1))

    done
  fi
done

