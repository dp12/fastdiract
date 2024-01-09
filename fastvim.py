#!/usr/bin/env python3

import fileinput
import os
import subprocess
import sys

if len(sys.argv) < 3:
    print("Too few arguments")
    sys.exit()

key = sys.argv[1]
filedir = sys.argv[2]
vim_file = os.path.join(filedir, ' '.join(sys.argv[3:]))

script_dir = os.path.dirname(os.path.realpath(__file__))
def_file = os.path.join(script_dir, "definitions")
cmd = "bash -c 'source {}; readlink -f $FASTVIM_FILE'".format(def_file)
fastvim_file = subprocess.check_output(cmd, shell=True).decode().strip()
for line in fileinput.input(os.path.expanduser(fastvim_file), inplace = 1):
    if line.startswith(key + " ="):
        line = key + " = " + vim_file + "\n"
    sys.stdout.write(line)
