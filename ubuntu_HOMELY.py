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


def supervisor():
    installpkg("supervisor", apt="supervisor", brew="supervisor")

    # clash
    symlink("supervisor.conf.d/clash.conf", "/etc/supervisor/conf.d/clash.conf")

    # restart supervisor
    execute("sudo systemctl restart supervisor.service")


def asdf():
    # install asdf

    # rust
    execute("asdf plugin add rust")
    # XXX proxy??
    # TODO version from env or latest
    execute("asdf install rust 1.58.1")
    execute("asdf global rust 1.58.1") 
    execute("asdf reshim rust")
    # rust pkg source config
    symlink(".cargo/config", "~/.cargo/config")

    # ruby 
    execute("asdf plugin add ruby")
    execute("asdf install ruby 2.7.5")
    exeucte("asdf global ruby 2.7.5")
    execute("asdf reshim ruby")

    # lua
    execute("asdf plugin add lua")
    execute("asdf install lua 5.4.4")
    exeucte("asdf global lua 5.4.4")
    execute("asdf reshim lua")

    # python
    execute("asdf plugin add python")
    execute("asdf install python 3.9.10")
    exeucte("asdf global python 3.9.10")
    execute("asdf reshim python")

    # haskell
    execute("asdf plugin add haskell")
    execute("asdf install haskell 9.2.2")
    exeucte("asdf global haskell 9.2.2")
    execute("asdf reshim haskell")

    # nodejs
    execute("asdf plugin add nodejs")
    execute("asdf install nodejs 16.14.0")
    exeucte("asdf global nodejs 16.14.0")
    execute("asdf reshim nodejs")

    # golang
    execute("asdf plugin add golang")
    execute("asdf install golang 1.17.8")
    exeucte("asdf global golang 1.17.8")
    execute("asdf reshim golang")

    # TODO erlang

    # elixir
    execute("asdf plugin add elixir")
    execute("asdf install elixir 1.13.3")
    exeucte("asdf global elixir 1.13.3")
    execute("asdf reshim elixir")
