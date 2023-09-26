# Set up mac server

### Open vnc

```sh
open vnc://Administrator:password@remote_host

#e.g.
open vnc://Administrator:RCR68hfP@208.52.168.11
```

### Create a user `rendering` as admin

Password: IMrendering#132

### Log out and log in as `rendering`

### Configure new server

### Insntall xcode

```sh
xcode-select --install
```

### Download files

```sh
cd ~
curl \
-O https://raw.githubusercontent.com/pkboom/im-support/master/ssh.sh \
-O https://raw.githubusercontent.com/pkboom/im-support/master/robbyrussell2.zsh-theme \
-O https://raw.githubusercontent.com/pkboom/im-support/master/.gitconfig \
-O https://raw.githubusercontent.com/pkboom/im-support/master/.macos \
-O https://raw.githubusercontent.com/pkboom/im-support/master/Brewfile \
-O https://raw.githubusercontent.com/pkboom/im-support/master/fresh.sh &&
chmod +x ssh.sh fresh.sh
```

### Create ssh

```sh
./ssh.sh
```

> https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=mac

### Register a public key as a deploy key on Github

```sh
pbcopy < ~/.ssh/id_ed25519.pub
```

> Give a public key to Jeff

### Install oh my zsh

```sh
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
```

### Install stuff

```sh
./fresh.sh
```

### Configure iterm2

<img src="/doc/iterm1.png" width="600">

```
~/code/rendering-ios
```

<img src="/doc/iterm4.png" width="600">

<img src="/doc/iterm5.png" width="300"> <img src="/doc/iterm6.png" width="300">

### Add new hosts

```js
// setup/sshCopy.js

let hosts = [
  {
    username: 'rendering',
    remote_host: '208.52.168.11',
  },
]
```

### Copy your public key to servers

```sh
node setup/sshCopy.js
```

> Now you can ssh into servers.

# Set up ansible

> Only once. if it is set up already, don't do this.

### Configure ansible

```sh
ansible-config init --disabled > ansible.cfg
```

```
# ansible.cfg
remote_user=rendering
interpreter_python=auto_silent
display_skipped_hosts=False
```

### list of inventory

```sh
ansible-inventory -i setup/inventory --list
```

### ping

```sh
ansible all -i setup/inventory -m ping
```

> If using mackup on the local, you will encounter this error:
>
> "Failed to connect to the host via ssh: unix_listener: path \"/Users/.../Mackup/.ansible/cp/38c87a86af.rWBxQ5VjUBPWc1Gu\" too long for Unix domain socket",
>
> Run these:

```sh
rm ~/.ansible

mkdir ~/.ansible
```

# Configure remote host

```sh
ansible-playbook -i setup/inventory_temp setup/ansible/configure.yml
```

### Configure .env

```
# setup/inventory_temp setup/ansible/actions.yml

actions:
  - change_env
```

```sh
ansible-playbook -i setup/inventory_temp setup/ansible/actions.yml
```

> Configure `NODE_ENV`, `DEV_EMAIL`, `DEV_EMAIL_APP_PASSWORD` and others manually if necessary.

Set computer name on mac server

```sh
sudo scutil --set ComputerName <new_hostname>

sudo scutil --set ComputerName "android gmail"
```

Change `servers.js`, `queues.js`.

Continue to set up:

[android](https://github.com/InboxMonster/rendering-ios/tree/main/android#set-up-emulator-and-app)

[desktop](https://github.com/InboxMonster/rendering-ios/tree/main/desktop)

[web](https://github.com/InboxMonster/rendering-ios/tree/main/web)
