#/bin/bash
netscan () {
    echo $1
    glpi-netdiscovery --first $1.0 --last $1.254 --entity ENTITY --threads 5 -i -s net-$1.0 --debug
    glpi-injector -R -v -x -u http://10.10.11.2:22571/front/inventory.php -d net-$1.0
}

netscan 10.10.0
netscan 10.10.1
netscan 10.10.2
