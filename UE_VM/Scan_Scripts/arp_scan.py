import argparse
from scapy.all import *


class scanner():
        """
        
        """
        def __init__(self, iface="uesimtun0", source_ip="10.45.0.15"):
            #(iface):
            self.results={}
            self.iface = iface
            self.source_ip=source_ip
            #self.arp_scan()
            self.packet_test()

        def packet_test(self):
            """
            """
            request = IP(src=self.source_ip , dst="10.45.0.25")/TCP(sport=0, dport=23, flags=1)
            answer, unanswered =srp(request, timeout=2, retry=1, iface=self.iface)
            print (answer)
        def arp_scan(self):
            """
            """
            request = IP(src=self.source_ip)/ ARP( pdst='10.45.0.25')
            answer, unanswered= srp(request, timeout=2, retry=2, iface=self.iface)
                
            for sent, recieved in answer:
                if not str(ip) in self.results:
                    self.results[str(ip)]=[]
                self.results[str(ip)].append()
            for i in self.results:
                print (i)
s=scanner()
