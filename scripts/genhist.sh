#!/bin/bash

curl http://localhost:8080/tix/bin/user/isphistogram > 1.html
wkhtmltopdf 1.html hist.pdf





