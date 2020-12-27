# inputfile for demo to select a rl1 device in the "device test" menu.
# Read in with command line option  "demo --cmdfile ..."
dc			# "device + cpu" test menu

# first, make a serial port. Default ist
#sd dl11
#p p ttyS2		# use "UART2 connector
#en dl11
#en kw11


pwr
.wait 3000		# wait for PDP-11 to reset
m i			# install max UNIBUS memory

# Deposit bootloader into memory
m ll dl.lst

en rl			# enable RL11 controller

# mount XXDP disk in RL02 #0 and start
en rl0			# enable drive #0
sd rl0			# select
p emulation_speed 10	# 10x speed. Load disk in 5 seconds
# set type to "rl02"
p runstopbutton 0	# released: "LOAD"
p powerswitch 1		# power on, now in "load" state
p image xxdp25.rl02 	# mount image file with test pattern
p runstopbutton 1	# press RUN/STOP, will start

.print Disk drive now on track after 5 secs
.wait	5000		# wait until drive spins up
p                       # show all params of RL1

en cpu20
sd cpu20

init

# start from addr 0
# p run 1

.print RL drives ready.
.print RL11 boot loader installed.
.print Emulated PDP-11/20 CPU will now boot XXDP.
.print Physical DL11-W used, stimulate LTC clock externally
.print Start CPU20 by toggeling CONT switch with "p c 1"
.print Start from 0 or 10000 to boot from drive 0, 10010 for drive 1, ...
.print Reload with "m ll"

.input
p c 1
