echo "Installing 5g trace tools"

cd /home/lily #change me!

git clone https://github.com/telekom/5g-trace-visualizer.git

if [ ! -f ./5g_trace-visualizer/plantuml.zip ]; then

	curl -L  http://sourceforge.net/projects/plantuml/files/plantuml-jar-asl-1.2019.12.zip/download --output 5g-trace-visualizer/plantuml.zip
fi

unzip ./5g-trace-visualizer/plantuml.zip 

sudo apt -y install wireshark tshark

sudo apt -y install default-jre python3-pip

sudo pip3 install --upgrade pyyaml packaging

pip3 install "jupyterlab>=3" "ipywidgets>=7.6"

pip3 install notebook

pip3 install jupyter-dash

pip3 install pandas

pip3 install lxml
