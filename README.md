<div style="text-align:center"><img src="../assets/fastdiract_logo.png?raw=true" width="500"></div>

## Overview

fastdiract (fastdir + fastaction + others) is a collection of shell tools based on key-value storage for quick shell navigation and command execution.

Each tool saves directories, commands, or other items to one of 10 "memory" slots in a file for quick retrieval via 2-character aliases (e.g. `d0`-`d9` or `f0`-`f9`).

### Fastdir
fastdir is a shell navigation tool to help you store and jump to your most frequently used directories (aka fastdirs), stored in slots `d0`-`d9`.

For example, you can cd to a `/deep/very/deep/directory` and run `d2.` to save that location to slot `d2`. In the future, whenever you run `d2`, you will jump to that saved directory.

Here's fastdir cycling through 7 directories in about 4 seconds:

<img src="../assets/fastdiract_fastdirs.gif?raw=true" width="500">

More commands:
- `d`/`d?` shows the list of fastdirs
- `dw` allows you to swap the position of two fastdirs
- `dx` changes the fastdir context
- `dX` creates a new fastdir context
- `d-` deletes a fastdir context
- `dm` shows the list of fastdirs and gives you a menu to run a command

### Fastaction

fastaction is a tool to save frequently executed commands, stored in slots `f0`-`f9`. To save a command to slot `f7`, run something like `f7. "echo hello there > myfile"`, making sure to wrap the command in double or single quotes. You can then execute the command easily by running `f7`.

<img src="../assets/fastdiract_fastactions.gif?raw=true" width="500">

More commands:
- `f`/`f?` shows the list of fastactions
- `fw` allows you to swap the position of two fastactions
- `fx` changes the fastaction context
- `fX` creates a new fastaction context
- `f-` deletes a fastaction context
- `fm` shows the list of fastactions and gives you a menu to run a command

### Fastvim

fastvim is a tool to open a file with vim. Files can be stored in slots `v0`-`v9`. To save a file to slot `v4`, run something like `v4. MYFILE.txt`. This will save the path of the file to fastvim, so it can be opened with vim easily with the command `v4`. To use an editor other than vim, change the value of the `FASTVIM_EDITOR` variable in the fastdiract defintions file.

More commands:
- `v`/`v?` shows the list of fastvim files
- `vw` allows you to swap the position of two fastvim files
- `vx` changes the fastvim context
- `vX` creates a new fastvim context
- `v-` deletes a fastvim context
- `vm` shows the list of fastvim files and gives you a menu to run a command

### Fastgdb

fastgdb lets you maintain a set of gdb user-defined commands (`g1`-`g5`) using fastdiract contexts (see below). This allows you to use different sets of gdb user-defined commands for different projects or use cases and easily swap between them.

For example, you may be debugging a complex bug and put some complicated user-defined gdb commands, from g1-g5, in `~/.fastdiract/.gdbinit`, which is in some existing context, e.g. `default`. But then, you may find the need to debug another complicated bug. To achieve this, you can create a new fastgdb context, e.g. `new_bug`, for the new bug and start writing new g1-g5 gdb commands. At any time, you can quickly switch back to the `default` fastgdb context to debug the first bug. 

To set up fastgdb, add `source MY_HOME_DIR/.fastdiract/.gdbinit` to your `~/.gdbinit` file.

### Fastdiract Contexts

For situations where there are more than 10 items to save and remember, fastdiract supports the creation and management of "contexts", which can be switched between easily.

The following gif shows how fastdir contexts are switched and used (the same can be done for fastaction contexts).

<img src="../assets/fastdiract_fastdir_ctx.gif?raw=true" width="500">

### Installation
To install fastdiract, run `install.sh`. 

fzf must be installed to support fastdir/fastaction context switching, and python is needed to support setting fastactions.

### Customization

fastdiract starts with some sane defaults, but it can be configured by changing the following options in the `definitions` file:

| Configuration Variable | Description     |
|------------------------|-----------------|
| `FASTDIR_POSTCMD`      | Command to execute after jumping to a fastdir, e.g. `ls` |
| `FASTDIR_ECHO`         | Whether to echo the fastdir command being executed, e.g. `cd mydir` |
| `FASTACT_ECHO`         | Whether to echo the fastaction command being executed, e.g. `echo 'hello there'` |
| `FASTACT_CONF`         | Whether to prompt for a `y/n` confirmation before executing a fastaction command |
| `FASTACT_MENU_CONF`    | Whether to prompt for a `y/n` confirmation before executing a fastaction from the menu (`fm`) | 
| `FASTDIR_D_RUNS_MENU`  | If set to `"on"`, running `d` will run the fastdir menu (`dm`). Otherwise, `d` will just display the current fastdirs. | 
| `FASTACT_F_RUNS_MENU`  | If set to `"on"`, running `f` will run the fastaction menu (`fm`). Otherwise, `f` will just display the current fastactions. | 
| `FASTVIM_V_RUNS_MENU`  | If set to `"on"`, running `v` will run the fastvim menu (`vm`). Otherwise, `v` will just display the current fastactions. | 
| `FASTVIM_EDITOR`       | Defines which editor to use with fastvim. Defaults to vim | 
| `CTX_COLOR`            | Can be set to an [ANSI color code](https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences) for highlighting the context in different fastdiract commands. The default is green (`\033[1;32m`). | 

### Misc

You can use fastaction commands recursively and use fastdir commands in fastaction commands, e.g. `f1. = "d1 && f2 && echo hello"`

Why would you want something like this when there are so many other directory navigation tools?
- Many tools like z or zoxide let you probabilistically switch to frequent or "frecent" directories, but when working with many directories with deep paths and similar names (e.g., `/tree/deep/in/the/forest` vs. `tree/deep/in/the/dark/forest`), there are no hard guarantees on where you'll end up. fastdiract, on the other hand, is fully deterministic since the user preselects the directory choices. Personally, I use bash aliases for directories I always use (e.g. `alias fav="cd myfavdir`), fastdiract for frequently used directories, and z for directories that I access infrequently.
- Some tools like bashmarks let you define a bookmark name and jump to it. However, remembering the names can get difficult and typing out long names takes time, whereas fastdiract lets you jump to any predefined directory with a 2-character combination, e.g., `d1`.

Why not just use bash aliases?
- bash aliases are useful for directories and commands you want to access frequently. However, the first time you define them, you need to re-source your ~/.bashrc or ~/.zshrc in every terminal where you want to use them. fastdiract saves items to files so that they are immediately accessible from every shell session. 
- I think of fastdiract as analogous to vim's transient marks or registers. It lets you save temporary directories or commands much more quickly than writing a new bash alias. However, for things that you want to make permanent, a bash alias may be more appropriate. I use both bash aliases and fastdiract extensively.

If you don't have fzf or would like to use a more stripped down version of fastdiract without contexts, check out the `minimal` branch.

### Acknowledgements

The hand icon in the logo was created by `nightwolfdezines` and comes from [Vecteezy](https://www.vecteezy.com/free-vector/human).
