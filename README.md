PushJet-Gtk [![License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](/LICENSE)
===========

PushJet-Gtk client for the Elementary OS desktop. It was written in Vala and uses
the Granite framework.

https://damoun.github.io/Pushjet-Gtk

## Introduction

[PushJet](http://pushjet.io/) is a notifications system.
You can create services that send notifications to any subscribed client.

PushJet-Gtk is a client under [MIT](https://tldrlegal.com/license/mit-license) license.

## Features

* Receive notifications

## Installation

### Building from source

To build from source, you need some libraries :

```sh
sudo add-apt-repository ppa:vala-team
sudo add-apt-repository ppa:elementary-os/daily
sudo apt-get update
sudo apt-get install valac-0.28 libvala-0.28-dev libgranite-dev libgtk-3-dev
```

```sh
git clone https://github.com/Damoun/Pushjet-Gtk.git
cd pushjet
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr ../
make
sudo make install
```

From there, you can run the binary pushjet
