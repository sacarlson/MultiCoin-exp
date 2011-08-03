# example of how to startup a group of multicoind running and then joined with merged mining
gnome-terminal --geometry=40x20+0+0 -t main -x /home/sacarlson/bitcoin/multicoin-exp/src/bitcoind -datadir=/home/sacarlson/.bitcoin/main
sleep 2
gnome-terminal --geometry=40x20+100+100 -t testnet -x /home/sacarlson/bitcoin/multicoin-exp/src/bitcoind -datadir=/home/sacarlson/.bitcoin/testnet
sleep 2
gnome-terminal --geometry=40x20+200+200 -t weeds -x /home/sacarlson/bitcoin/multicoin-exp/src/bitcoind -datadir=/home/sacarlson/.bitcoin/weeds
sleep 2
gnome-terminal --geometry=40x20+300+300 -t beer -x /home/sacarlson/bitcoin/multicoin-exp/src/bitcoind -datadir=/home/sacarlson/.bitcoin/beer
sleep 2 
gnome-terminal --geometry=40x20+400+400 -t mm1 -x /home/sacarlson/bitcoin/multicoin-exp/src/bitcoind -datadir=/home/sacarlson/.bitcoin/mergemine

#sleep 20
#gnome-terminal --geometry=40x20+500+500 -t mmproxy -x /home/sacarlson/bitcoin/multicoin-exp/contrib/merged-mine-proxy --parent-url http://yourusername:yourpassword@127.0.0.1:38332/ --aux-url http://yourusername:yourpassword@127.0.0.1:10332/ http://yourusername:yourpassword@127.0.0.1:58332/ -w 9992
#sleep 4
#gnome-terminal --geometry=40x20+600+600 -t minerd -x /home/sacarlson/bitcoin/cpuminer/minerd --url http://127.0.0.1:9992/ --userpass yourusername:yourpassword -t 1
#sleep 2
#gnome-terminal --geometry=40x20+700+700 -t minerd -x /home/sacarlson/bitcoin/cpuminer/minerd --url http://127.0.0.1:10332/ --userpass yourusername:yourpassword -t 1

