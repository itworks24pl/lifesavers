#/bin/bash
netscan () {
    echo $1
    glpi-netdiscovery --first $1.0 --last $1.254 --entity ENTITY --threads 5 -i -s net-$1.0 --debug
}

netscan 10.10.0
netscan 10.10.1
netscan 10.10.2
