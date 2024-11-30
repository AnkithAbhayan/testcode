#! /usr/bin/python3

import os
import sys

class Data:
    def __init__(self):
        args = sys.argv
        if len(args)==1:
            self.filename = "test.py"
        else:
            self.filename = args[1]
        self.path = "/home/ankith/Documents/test"

    def wipedown(self):
        if not os.path.exists(self.path):
            os.mkdir(self.path)
            
        self.fullpath = self.path+"/"+self.filename
        n=1
        while True:
            if os.path.exists(self.fullpath):
                name = self.filename.split(".")
                name = name[0]+str(n)+"."+name[1]
                self.fullpath = self.path+"/"+name
                n+=1
            else:
                break
        file = open(self.fullpath, "w")
        file.close()

    def openeditor(self):
        print(f"Starting editor - {self.fullpath.split('/')[-1]}")
        os.system(f"subl {self.fullpath}")

client = Data()
client.wipedown()
client.openeditor()
sys.exit()
