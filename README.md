# 5G Project

A simulation of a 5G core network using [Open5gs](https://open5gs.org/open5gs/about/) and [UERANSIM](https://github.com/aligungr/UERANSIM). The system runs on two seperate Ubuntu 20 VMs.

## Setup 
```
#TODO set up scripts 
#(change path of absolout paths and set up 
link to start scripts.)
```


## $$\color{blue}{\mathbf{UE\text{ }VM}}$$

### [Exploits](5G/UE_VM/Exploit_Scripts/)

1. **Network Scan** [- Find exposed IPs](5G/UE_VM/Exploit_Scripts/Scan_Network)
1. **SBI** [- Check what you can find from by utilizing the service based interfaces](5G/UE_VM/Exploit_Scripts/SBI)
    1. Finding functions of IP addresses
	    1. Identify NRF
	    2. Get NF SBI Data
   2. Checking UEs
      1. Get IMSIs from AUSF
      2. Get UE Registration Data and More
   3. Targeting the SMF
	    1. Get IMSIs and Session Data
  	  2. SMF UE DOS with unauthorized Session Release
      
1. **PFCP** [- Based DOS and Eavesdrop Attack](5G/UE_VM/Exploit_Scripts/PFCP)
   1. Unauthorized PFCP Session Delete Request
	 2. Session Modify to Drop
   3. Session Modify GNB address
   4. Crash UPF
      1. Flood Associate
      2. Malformed Modification Request
2. **IOT Lock** [Half of a man in the middle attack using PFCP modification requests](5G/UE_VM/Exploit_Scripts/IOT_lock)
2. **SSH Intrusion** [Finds an open ssh server and bruteforces entry to 5G core.](5G/UE_VM/Exploit_Scripts/SSH)
3. **Spy** [forward all traffic on certain interface from victim machine to attackers.](5G/UE_VM/Exploit_Scripts/Spy)

## $$\color{teal}{\mathbf{Core\text{ }VM}}$$
