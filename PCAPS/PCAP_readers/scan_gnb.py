from scapy.all import *

for packet in PcapReader("../GNB/start_add_ue0_ping.pcapng"):#TODO use arguement
    try:
        #print(packet)
        layers= packet.payload.layers()
        if (packet[IP].src)=="10.45.0.31": 
            print("ue")
            for layer in layers:
                print(layer)
                print("")
    except Exception as e:
        print ("ERROR!", e)
        print(layers)
        pass
