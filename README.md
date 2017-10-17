# Why did I decide to write blockscript?
The blockscript project was designed to help novice Linux users with a more secure set-and-forget alternative to their consumer router or software firewall. More advanced users may be interested in building a basic home Security Operations Center (SOC) or labenvironment by running blockscript on a hardened SELKS distro in combination with tools like fail2ban, tripwire, broscript etc. Preferably on dedicated hardware such as an old computer or server.

# Iptables
Network packets entering or leaving a networked Linux computer pass a number of tables in the kernel. Each table contains zero or more simple rules where the IP address or specific properties of a packet are checked. If a rule matches, a number of actions can be triggered. A network packet can be simply ignored, accepted, rejected or forwarded to another table with rules. Although the principle of this firewall system is simple, it is often quite difficult to setup a decent firewall which matches the need of a specific situation. This is partly because it needs understanding of the underlying structure, and partly because there is no real good documentation which explains the working in such a way that is can be easily understood by people who aren't a network administrator. There is also the problem that you can solve a firewall problem in many ways with iptables, where many solutions are not optimal because they are either not scalable, flexible or both. Lammert Bies explains the framework of the firewall settings in his article called: A near perfect iptables firewall configuration. This is something I use in a slightly modified way on some of my networked Linux computers and it feels good to return this to the community. For your convience I have included the link below. 
https://www.lammertbies.nl/comm/info/iptables.html

# How to install blockscript?
First of all we need to install a package called iptables. 

sudo apt-get install iptables-persistent; 

Blockscript is hardcoded to work from the /opt/custom directory. We will create this folder and navigate to the directory /opt/custom/ with the following command:

sudo mkdir /opt/custom; cd /opt/custom; 

Now we are ready to clone this project with the following command:

sudo git clone https://github.com/101sec/blockscript.git; 
cd blockscript; 

You may need to customize the firewall settings. The location is /opt/custom/iptables/v4.rules. 
sudo leafpad /opt/custom/iptables/v4.rules;

I recommend you to disable IPv6 at this moment for reasons. How to disable IPv6 on your distro may vary from my settings. If you do not know how to do this, Google is your friend :).

When your ready to test your configuration, we can move the firewall settings to the appropriate directory.

sudo mv /opt/custom/iptables/v4.rules /etc/iptables/;

To display the current firewall configuration

sudo iptables -L

To activate the newly configurated firewall rules

sudo iptables-restore < /etc/iptables/v4.rules;

# How to use blockscript?
Blockscript consists of two parts. The first part fetches threat information from public feeds, while the add_enemies.sh script adds them to the blocklist of our firewall configuration. Blockscript is flexible by design and can be used manually or configured to work fully automated in the background. 

./fetch_feeds - Fetches feeds from Zeus Tracker, Autoshun and others.
./add_enemies - Adds all IP-addresses from the retrieved feeds to the blocklist.
./addenemy <IP-ADDRESS> - Adds a single IP-address to the blocklist. 


# Add a cronjob to fetch feeds automatically

sudo crontab -e

Add the following lines:

0 */2 * * * /opt/custom/blockscript/fetch_feeds.sh

30 23 * * * /opt/custom/blockscript/add_enemies.sh

Per this entry, cron will frequently fetch the latest info without DOS'ing the servers and run add_enemies.sh at 23:30 (11.30pm) once a day, every day. 