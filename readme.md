# Dotfiles

## Setup

use `chezmoi`

```sh
sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply kongsakchai
```

go to dotfile directory

```sh
chezmoi cd
```

- Linux
    ```
    ./setup/install-linux.sh
    ```
- Mac
    ```
    ./setup/install-macos.sh
    ```

---

## VSCode

- setting.json
- extensions.text

**Install Extensions**

 ```
 cat extensions.txt | xargs -L 1 code --install-extension
 ```
