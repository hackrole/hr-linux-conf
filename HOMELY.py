from pathlib import Path
from homely.files import symlink, download, mkdir
from homely.system import execute
from homely.install import installpkg


def install_brew():
    execute(
        '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" '
    )
    installpkg("git", brew="git")


def zsh():
    installpkg("zsh", apt="zsh", brew="zsh")
    symlink("zshrc", "~/.zshrc")
    symlink("oh-my-zsh", "~/.oh-my-zsh")
    symlink("bashrc", "~/.bashrc")
    symlink("alias", "~/.alias")

    # git config
    symlink("gitconfig", "~/.gitconfig")

    # tmux
    installpkg("tmux", apt="tmux", brew="tmux")
    symlink("tmux.conf", "~/.tmux.conf")
