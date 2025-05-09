

pcap_file=${1:-"../5G/PCAPS/Core/full_start_one_one.pcapng"}
cd /home/lily/5g-trace-visualizer #change me
#python3 trace_visualizer.py -wireshark "OS" ../5G/PCAPS/GNB/start_add_ue0_ping.pcapng 

python3 trace_visualizer.py -wireshark "OS" -http2ports "7777,34742" -showheartbeat False -simple_diagrams True -openstackservers "../5G/PCAPS/PCAP_readers/iP_address_names.yaml" -force_order "UE,UE_1,UE_0,UE_1,UE_2,UE_3,gNB,AMF,SMF,UPF,UPF_2,SGWU,SGWC" -show_timestamp False -show_selfmessages True -force_show_frames "4129" "$pcap_file"

