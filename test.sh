#!/bin/bash

awk -F "&|=" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16}' OFS=',' interndata.dat |
awk -F, '($11 ~ /[^0-9]/ || $3 ~ /[^0-9]/ || $9 ~ /[^0-9]/ || length($3)!=13 || length($11)!=13 \
|| length($13)!=1)' OFS=',' > error.csv
"C:\Program Files (x86)\LibreOffice\program\soffice.exe" --calc error.csv



awk -F "&|=" '{print $3,$5,$7,$9,$11,$12,$13,$14,$15}' OFS=',' interndata.dat | sed "s/\,,//g" |
awk -F, '{ 
    gsub(/[^0-9]/,"",$1);
    gsub(/[^0-9]/,"",$3);
    gsub(/[^0-9]/,"",$4); 
    gsub(/[^0-9]/,"",$5);
    gsub(/[^0-9]/,"",$6); 
    gsub(/[^0-9]/,"",$7)}1' OFS=',' |

awk -F, '(length($1) == 13)' |
awk -F, '(length($5) == 13)' |
awk -F, '($2=="Pune" || $2=="Seattle" || $2=="Detroit" || $2=="London"|| $2=="Sydney" || $2=="Guadalajara")' |
awk -F, '(length($7) == 1)' OFS=',' | awk '!seen[$0]++' | sed "s/\,,/,/g" > test.csv 
"C:\Program Files (x86)\LibreOffice\program\soffice.exe" --calc test.csv

