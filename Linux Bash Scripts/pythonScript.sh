#! /bin/sh
# Open Python File with Arguments


if [ -n "${my_param}" ]
then
    my_param_str="--my_param \"${my_param}\""
fi


echo ${my_param_str}|xargs python -u $1
#echo ${my_param_str}|xargs python -u my_script.py