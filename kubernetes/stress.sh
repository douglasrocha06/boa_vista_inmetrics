#! bin/bash

for i in {1..10000}; do
    curl 34.66.3.44:80
    sleep $1

done