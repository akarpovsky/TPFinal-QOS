#!/bin/bash

n=1
#a="$(curl localhost:8080/tix/bin/user/users)"
a="$(curl localhost:8080/bin/user/users)"

curr_date="$(date +'%m-%Y')"
mkdir $curr_date
cd $curr_date

for item in $(echo $a | sed 's/;/ /g'); do
 echo $item
 `wkhtmltopdf http://localhost:8080/bin/user/userreport?nickname=$item  $item.pdf`
  cd ..
  python sendUserReports.py --user $item 
  cd $curr_date
 #`wkhtmltopdf http://localhost:8080/tix/bin/user/userreport?nickname=$item  $item.pdf`
done;
