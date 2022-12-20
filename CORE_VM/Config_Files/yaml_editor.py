import sys
import ruamel.yaml
import os, glob

class Editor():
    def __init__(self, to_change=None):
        self.yaml=ruamel.yaml.YAML()
        #self.yaml.reserve_quotes=True
        self.update_dict={"nrf":"sbi",
                         "upf":"pfcp"}
        if to_change==None:
            self.to_change={
                    "nrf": [{"addr": "10.0.8.1", "port" :7777}],
                    "upf": {"addr":"10.0.17.1"}}
        
        self.check_files()
        return
    
    def change_entry(self, elem, data, change):

        if elem in self.update_dict:

            if elem=="upf" or elem=="nrf":
                data[elem][self.update_dict[elem]]=change
        else:
            data[elem]=change
        return data

    def check_files(self):
        for file in glob.glob('*.yaml'):
            print("Editing file: ", file)
            with open(file) as f:
                data = self.yaml.load(f)
            for elem in data:
                if elem in self.to_change.keys():
                    data= self.change_entry(elem, data, self.to_change[elem])
            with open(file, "w") as f:
                self.yaml.dump(data, f)



editor=Editor()
