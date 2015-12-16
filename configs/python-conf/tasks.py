#!/usr/bin/env python
# encoding: utf-8

from __future__ import unicode_literals

""" 使用invoke完成基本的配置安装任务 """

import os
import sys
import time
import logging


logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s]: %(message)s",
    stream=sys.stdout
)


try:
    from invoke import task
    from invoke import run
except:
    logging.warning("you not install invoke now.")
    logging.warning("try this command. ")
    logging.warning("sudo apt-get install python-pip python-setuptools")
    logging.warning("sudo pip install invoke -i"
                    " https://pypi.douban.com/simple")
    raise Exception("invoke not install, install it first")


def get_abspath(fn):
    """ 返回fn的绝对路径 """
    return os.path.realpath(os.path.expanduser(fn))


def bakfile(fn):
    """ 备份文件. warning: 使用绝对路径 """
    if not os.path.exists(fn):
        msg = "file %s not exists"
        logging.warning(msg)
        return

    if os.path.islink(fn):
        logging.info("remove link file %s" % fn)
        os.remove(fn)
    else:
        new_fn = '.'.join([fn, time.strftime('%Y%m%d%H%M')])
        logging.info("bakup file %s to %s" % (fn, new_fn))
        os.rename(fn, new_fn)


def cp_config_file(source, dist):
    """ cp配置文件到指定位置 """
    source = get_abspath(source)
    dist = get_abspath(dist)

    # 备份
    bakfile(dist)
    run("cp %s %s" % (source, dist))


def make_wget_cmd(url, fname):
    """ 创建通用wget下载cmd """
    download_dir = "~/Downloads"
    download_file = os.path.join(download_dir, fname)

    return "wget -c {url} -O {download_file}".format(
        url=url, download_file=download_file)


def make_git_cmd(url, output):
    """ 创建通用git-clone命令 """
    download_dir = "~/Downloads"
    download_output = os.path.join(download_dir, output)

    return "git clone {url} {download_output}".format(
        url=url, download_output=download_output)


def download_package(url, output):
    if url.startswith('git'):
        cmd = make_git_cmd(url, output)
    else:
        cmd = make_wget_cmd(url, output)

    logging.info("================>>>>")
    msg = "start download pkg: %s from %s" % (output, url)
    logging.info(msg)
    try:
        run(cmd)
    except Exception as e:
        msg = "download pkg: %s from %s failed!!!" % (output, url)
        logging.warning(msg)
        logging.warning('Exception: %s' % e.message)
    else:
        msg = "finish download pkg: %s from %s" % (output, url)
        logging.info(msg)
    logging.info("<<<<==================")


# ================================================
# 安装linux配置文件和软件
# ================================================
@task
def install_basic():
    """ 安装必要的配置文件 """
    config_list = {
        'profile': {
            'source': './profile',
            'dist': '~/.profile',
            'comment': '',
        },
        'bashrc': {
            'source': './bashrc',
            'dist': '~/.bashrc',
            'comment': '',
        },
        'alias': {
            'source': './alias',
            'dist': '~/.alias',
            'comment': '',
        },
        'gnomerc': {
            'source': './gnomerc',
            'dist': '~/.gnomerc',
            'comment': '',
        },
    }

    for name, config in config_list.items():
        source = config['source']
        dist = config['dist']
        cp_config_file(source, dist)


@task
def install_extra():
    """ 安装其他扩展配置文件 """
    source = get_abspath("./bashrc")
    dist = get_abspath("~/.bashrc")
    bakfile(dist)
    cmd = "ln -s %s %s" % (source, dist)
    run(cmd)


@task
def pkg_install():
    run("sudo apt-get install -y aptitude unzip zip unrar rar")
    run("sudo aptitude install -y python-setuptools python-pip")
    run("sudo aptitude install -y gcc g++ cmake make autoconf automake")
    run("sudo aptitude install -y openssh-server openssl-dev")


@task
def python_pkg_install():
    run("sudo pip install virtualenv fabric invoke")


@task
def download_pkg():
    """ 下载常用软件 """
    package_list = {
        'vim': {
            'url': 'git@github.com:vim/vim.git',
            'output': 'vim',
            'comment': ("download vim7.4 source to compile for YCM."
                        "you need to compile YCM after install vim"),
        },
        'emacs': {
            'url': 'git@github.com:emacs-mirror/emacs.git',
            'output': 'emacs',
        },
        'ctags5.8': {
            'url': 'http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz',
            'output': 'ctags5.8.tar.gz',
        },
        'vagrant': {
            'url': 'git@github.com:mitchellh/vagrant.git',
            'output': 'vagrant',
        },
        'awesome-wm': {
            'url': 'git@github.com:awesomeWM/awesome.git',
            'output': 'awesome',
        },
        'musca-wm': {
            'url': 'http://aerosuidae.net/musca-0.9.24.tgz',
            'output': 'musca-0.9.24.tgz',
        },
        'dmenu': {
            'url': 'http://dl.suckless.org/tools/dmenu-4.5.tar.gz',
            'output': 'dmenu-4.5.tar.gz',
        },
        'google-chrome': {
            'url': ('https://dl.google.com/linux/direct/'
                    'google-chrome-stable_current_amd64.deb'),
            'output': 'chrome-current_amd64.deb',
        },
        'ruby2.2': {
            'url': 'http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz',
            'output': 'ruby-2.2.2.tar.gz',
        },
        'lua5.3': {
            'url': 'http://www.lua.org/ftp/lua-5.3.0.tar.gz',
            'output': 'lua-5.3.0.tar.gz',
        },
        'lua5.1': {
            'url': 'http://www.lua.org/ftp/lua-5.1.tar.gz',
            'output': 'lua-5.1.tar.gz',
        },
        'node.js': {
            'url': 'http://nodejs.org/dist/v0.12.4/node-v0.12.4.tar.gz',
            'output': 'node-v0.12.4.tar.gz',
        },
        'golang1.4.3': {
            'url': 'https://storage.googleapis.com/golang/go1.4.2.src.tar.gz',
            'output': 'go1.4.2.src.gz'
        },
        'python3.4': {
            'url': '',
            'output': '',
            'comment': 'XXX not add now',  # XXX
        },
    }

    output = 'awesome'
    for name, value in package_list.items():
        url = value['url']
        output = value['output']
        download_package(url, output)
