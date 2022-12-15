change=${1:-RESTART}

declare -l change #make lower case just in case
change=$change

if [ "$change" == "start" ] || [ "$change" == "stop" ] ;
then
	echo Will $change all open5gs functions.
else
	echo Reverting to default, restart.
	change=restart
fi

sudo systemctl "$change" open5gs-mmed

sudo systemctl "$change" open5gs-sgwcd

sudo systemctl "$change" open5gs-amfd

sudo systemctl "$change" open5gs-sgwud

sudo systemctl "$change" open5gs-upfd

sudo systemctl "$change" open5gs-hssd

sudo systemctl "$change" open5gs-pcrfd

sudo systemctl "$change" open5gs-nrfd

sudo systemctl "$change" open5gs-scpd

sudo systemctl "$change" open5gs-ausfd

sudo systemctl "$change" open5gs-udmd

sudo systemctl "$change" open5gs-pcfd

sudo systemctl "$change" open5gs-nssfd

sudo systemctl "$change" open5gs-bsfd

sudo systemctl "$change" open5gs-udrd



