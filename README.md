# ShazamClean
A cleaner script to free up space on the Linux sessions of 42Lausanne.

# Remote execution
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/BWG31/ShazamClean/refs/heads/main/ShazamClean.sh)"
```

# Install
 - Run the following to install:
	```sh
	git clone https://github.com/BWG31/ShazamClean && cd ShazamClean && ./install.sh && cd .. && rm -rf ShazamClean
	```

# Uninstall
 - Run the following to uninstall:
	```sh
	~/.config/ShazamClean/uninstall.sh
	```

# Add new directories to clean
You can add any new directories you wish to be included in the cleaning process.

Simply add them as a newline to the cleaning_list file located at: `~/.config/ShazamClean/cleaning_list.txt`

All lines have the $HOME variable prepended to them automatically.

WARNING: Be careful with what you add to the cleaning list as no confirmation is asked during the script execution.
