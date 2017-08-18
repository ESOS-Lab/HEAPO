#!/bin/bash

ERROR="error.msg"
ERROR_MSG=

sed -i -r "1s/Total/Potal/" asdsad.ssd > $ERROR 2>&1
ERROR_MSG=$(cat $ERROR)
echo $ERROR_MSG
