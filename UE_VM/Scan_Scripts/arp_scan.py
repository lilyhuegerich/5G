import argparse
from scapy.all import *


class scanner():
        """
        
        """
        def __init__(self):
            #(iface):
            self.results={}
            self.iface ="uesimtun0"
            self.arp_scan()
        def arp_scan(self):
            """
            """
            request = Ether(dst="ff:ff:ff:ff:ff:ff")/ ARP(pdst='10.45.0.25')
            answer, unanswered= srp(request, timeout=2, retry=2, iface=self.iface)
                
            for sent, recieved in answer:
                if not str(ip) in self.results:
                    self.results[str(ip)]=[]
                self.results[str(ip)].append()
            for i in self.results:
                print (i)
s=scanner()
