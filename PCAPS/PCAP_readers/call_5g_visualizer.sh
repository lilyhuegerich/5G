pcap_file={}

#python3 trace_visualizer.py -wireshark "OS" ../5G/PCAPS/GNB/start_add_ue0_ping.pcapng 

python3 trace_visualizer.py -wireshark "OS" -showheartbeat False -simple_diagrams True -openstackservers "../5G/PCAPS/PCAP_readers/iP_address_names.yaml" -force_order "UE_0,UE_1,UE_2,UE_3,gNB,UPF,AMF,SMF,SGWU,SGWC" -show_timestamp True ../5G/PCAPS/Core/full_start.pcapng 

