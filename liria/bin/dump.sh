#!/bin/bash

tables="comment profile recipe user tag"

for table in $tables; do
    sql="show tables where Tables_in_mad like '$table%'"
    subtables=$(echo "$sql" | mysql -u root -N mad)

    for subtable in $subtables; do
        mysqldump -u root mad $subtable
    done
done
