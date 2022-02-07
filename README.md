<div style="text-align:center"><img src="../assets/fastdiract_logo.png?raw=true" width="500"></div>

## Overview

fastdiract (fastdir + fastaction) is a pair of shell tools based on key-value storage for quick shell navigation and command execution.

Each tool saves directories/commands to one of 10 "memory" slots in a file for quick retrieval via 2-character aliases (`d0`-`d9` and `f0`-`f9`).

This is the minimal branch of fastdiract, which does not require fzf and does not have support for contexts. It is suitable for environments that don't have fzf installed or where you may not have time to define the full set of functions that are in the master branch.

### Fastdir
fastdir is a shell navigation tool to help you store and jump to your most frequently used directories (aka fastdirs), stored in slots `d0`-`d9`.

For example, you can cd to a `/deep/very/deep/directory` and run `d2.` to save that location to slot `d2`. In the future, whenever you run `d2`, you will jump to that saved directory.

Here's fastdir cycling through 7 directories in about 4 seconds:

<img src="../assets/fastdiract_fastdirs.gif?raw=true" width="500">

More commands:
- `d`/`d?` shows the list of fastdirs

### Fastaction

fastaction is a tool to save frequently executed commands, stored in slots `f0`-`f9`. To save a command to slot `f7`, run something like `f7. "echo hello there > myfile"`, making sure to wrap the command in double or single quotes. You can then execute the command easily by running `f7`.

<img src="../assets/fastdiract_fastactions.gif?raw=true" width="500">

More commands:
- `f`/`f?` shows the list of fastactions

### Installation
To install fastdiract, run `install.sh`. 

Python is needed to support setting fastactions.

### Misc

You can use fastaction commands recursively and use fastdir commands in fastaction commands, e.g. `f1. = "d1 && f2 && echo hello"`

Why would you want something like this when there are so many other directory navigation tools?
- Many tools like z or zoxide let you probabilistically switch to frequent or "frecent" directories, but when working with many directories with deep paths and similar names (e.g., `/tree/deep/in/the/forest` vs. `tree/deep/in/the/dark/forest`), there are no hard guarantees on where you'll end up. fastdiract, on the other hand, is fully deterministic since the user preselects the directory choices. Personally, I use bash aliases for directories I always use (e.g. `alias fav="cd myfavdir`), fastdiract for frequently used directories, and z for directories that I access infrequently.
- Some tools like bashmarks let you define a bookmark name and jump to it. However, remembering the names can get difficult and typing out long names takes time, whereas fastdiract lets you jump to any predefined directory with a 2-character combination, e.g., `d1`.

### Acknowledgements

The hand icon in the logo was created by `nightwolfdezines` and comes from [Vecteezy](https://www.vecteezy.com/free-vector/human).
