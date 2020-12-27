# inputfile for demo to select a rl1 device in the "device test" menu.
# Read in with command line option  "demo --cmdfile ..."
d			# device menu
pwr			# reboot PDP-11
.wait 3000		# wait for PDP-11 to reset
m i			# install max UNIBUS memory

# Deposit bootloader into memory
m ll du.lst

en uda			# enable UDA50 controller

# mount 2.11bSD in drive #0 and start
en uda0			# enable drive #0
sd uda0			# select drive #0

p type RA92
p image 2.11BSD_44.ra92 # mount image file with test pattern

.print MSCP drives ready.
.print UDA50 boot loader installed.
.print Start 10000 to boot from drive 0, 10010 for drive 1, ...
.print Reload with "m ll"
.print
.print Set terminal to 9600 7O1
.print At "44Boot" prompt, just hit RETURN.
.print Login as "root", log out to enter multi user run level.



