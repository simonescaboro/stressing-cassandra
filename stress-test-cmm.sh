if [ -z "$1" ]
    then
        echo "No file path given: use \"None\" when stressing via write/read (instead of user) operations."
else
    ./utility/create_folders.sh
    for mod in ONE TWO QUORUM ALL
    do
        for i in {1..10}
        do
            ./operations $1 $mod $i
        done
    done	
fi

	