# How to install blockscript?

sudo apt-get install iptables-persistent; 
sudo mkdir /opt/custom; 
cd /opt/custom; 
git clone https://github.com/101sec/blockscript.git; 
cd blockscript; 
mv v4.rules /etc/iptables/;
sudo iptables-restore < /etc/iptables/v4.rules;

# Add a cronjob to fetch feeds automatically
0 */2 * * * /opt/custom/blockscript/fetch_feeds.sh
