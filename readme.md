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
    cd setup && ./install-linux.sh
    ```
- Mac
    ```
    cd setup && ./install-macos.sh
    ```

---

## VSCode

- setting.json
- extensions.text

**Install Extensions**

- Linux

    ```
    cat extensions.txt | xargs -L 1 code --install-extension
    ```

- Windows (PowerShell)
    ```sh
    Get-Content extensions.txt | ForEach-Object { code --install-extension $_ }
    ```
