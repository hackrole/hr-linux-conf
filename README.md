# hr-linux-conf

my linux conf, include some makefile, bash, and maybe anything else


## configure keyboard in ubuntu

1) install apt

```shell
sudo apt install rofi rofi-dev
```

2) configure keyboard in systemconfig

```
# used to switch windows and run application
# keyboard Mod4(super) + Shift + o
rofi -combi-modi window,run -modi combi,window,run,keys -show
```

### TODO rofi default keys and configure.


## configure xmonad


### TODO install 

1) install with stack or cabel. the system version fail too much.

```

```

2) install required tools

```shell
sudo apt install xmobar taffbar ...
```

### comipile configure

```shell
ln -s xmonad.hs ~/.xmonad/xmonad.hs
xmonad --recompile
```

## docker

### install and configure mirror

```shell
# install for  [tuna.tsinghua](https://mirrors.tuna.tsinghua.edu.cn/help/docker-ce/)

sudo apt-get remove docker docker-engine docker.io
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce

# add user to docker,maybe need restart or ??
sudo usermod -a -G docker $(echo $USER)

# configure docker mirror
echo '{"registry-mirrors": ["https://registry.cn-hangzhou.aliyuncs.com"]}' | sudo tee /etc/docker/daemon.json
```

### run redis with docker

```shell
docker run --name redis -p 6379:6379 -d --restart always redis:latest

# connect to redis

## from docker
docker run -it --rm --name redis-cli --link redis redis redis-cli -h redis

## from host tool
sudo apt install redis
sudo systemctl disable redis
sudo systemctl stop redis
redis-cli
````

### run mysql with docker

```shell
docker run -d --name mysql --restart always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root mysql:latest

# install client
sudo apt install mysql-client
mysql -u root -p -h 127.0.0.1
```

### run postgresql with docker

```shell
docker run --name postgresql --restart always -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres postgres 
```

#### TODO connnect to pgsql and auth


## asdf-vm 


### python


#### python tools

```shell
pip install mycli httpie
asdf reshim python
```

## tools

### zathura

TODO zathura open 

```shell
sudo apt install zathura zathura-dev zathura-pdf-poppler 
```


### tmux

DONE fix copy to xclip in ubuntu

```shell
sudo apt install sel xclip
mkdir -p ~/.tmux/plugins
ln -s ~/hr-conf/hr-linux-conf/.tmux/plugins/tpm ~/.tmux/plugins/tpm
# restart tmux
```


### dropbox

### google drive
