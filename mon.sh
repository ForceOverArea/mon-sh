#!/usr/bin/bash

# mon - a wrapper for watch/vcgencmd for rpi4.
# enter 'setup' at the first prompt to add 'mon' as an alias to ~/.bashrc
# Grant C 2022;

echo "What do you want to measure? [s]peed [t]emperature [v]oltage"
read CHOICE
if [ $CHOICE == "s" ] 
then
    echo "Which clock to measure? [a]rm [c]ore"
    read CLOCK
    if [ $CLOCK == "a" ] 
    then
        watch -n 0.1 vcgencmd measure_clock arm
    elif [ $CLOCK == "c" ] 
    then 
        watch -n 0.1 vcgencmd measure_clock core
    else
        echo "Invalid selection."
    fi
elif [ $CHOICE == "t" ] 
then
    watch -n 0.1 vcgencmd measure_temp
elif [ $CHOICE == "v" ] 
then
    watch -n 0.1 vcgencmd measure_volts core
elif [ $CHOICE == "setup" ]
then
    echo "alias mon='~/Documents/.mon.sh'" >> ~/.bashrc
else
    echo "Invalid selection."
fi