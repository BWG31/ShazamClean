# ShazamClean
A cleaner script to free up space on the Linux sessions of 42Lausanne.

# Remote execution
```sh
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/BWG31/ShazamClean/refs/heads/main/ShazamClean.sh)"
```

# Install

This script simply creates the alias `42clean` in your `~/.zshrc` and `~/.bashrc`.

```sh
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/BWG31/ShazamClean/refs/heads/main/install.sh)"
```

# Run
```sh
	42clean
```

# Uninstall

```sh
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/BWG31/ShazamClean/refs/heads/main/uninstall.sh)"
```

# Add new directories to clean
You can add any new directories you wish to be included in the cleaning process.

Simply add them as a newline to the cleaning_list file located at: `~/.config/ShazamClean/cleaning_list.txt`

All lines have the $HOME variable prepended to them automatically.

WARNING: Be careful with what you add to the cleaning list as no confirmation is asked during the script execution.
