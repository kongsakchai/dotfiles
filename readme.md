# Dotfiles

## Setup

### Pre Setup 

Update Packages (Linux only)

```sh
sudo apt update
```

### Setup

use `chezmoi` to install and Apply Dotfiles

```sh
sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply kongsakchai
```

go to `chezmoi directory`

```sh
export PATH=$PATH:$HOME/bin && chezmoi cd
```

Install Dependencies

- Linux
    ```
    ./setup/install-linux.sh
    ```
- MacOS
    ```
    ./setup/install-macos.sh
    ```

---

## VSCode

- `settings.json` — VSCode configuration
- `extensions.txt` — List of all extensions

**Install All Extensions at Once**

 ```
 cat extensions.txt | xargs -L 1 code --install-extension
 ```
