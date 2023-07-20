# Setup

Open vnc

```sh
open vnc://Administrator:password@remote_host
```

Create a user `rendering` as admin

Log out and in as `rendering`

Set up mac

Insntall xcode

```sh
xcode-select --install
```

Download

```sh
cd ~
curl \
-O https://raw.githubusercontent.com/pkboom/im-support/master/ssh.sh \
-O https://raw.githubusercontent.com/pkboom/im-support/master/robbyrussell2.zsh-theme \
-O https://raw.githubusercontent.com/pkboom/im-support/master/.gitconfig \
-O https://raw.githubusercontent.com/pkboom/im-support/master/.macos \
-O https://raw.githubusercontent.com/pkboom/im-support/master/Brewfile \
-O https://raw.githubusercontent.com/pkboom/im-support/master/fresh.sh \
chmod +x ssh.sh fresh_desktop.sh
```

Create ssh

```sh
./ssh.sh
```

> Register a public key as a deploy key on Github

https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=mac

Install oh my zsh

```sh
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
```

Install for desktop

```sh
./fresh_desktop.sh
```

Install for android

```
./fresh_android.sh
```

Install for web

```
./fresh_web.sh
```

# Set up

Configure iterm2

<img src="/doc/iterm1.png" width="600">

```
~/code/rendering-ios
```

<img src="/doc/iterm4.png" width="600">

<img src="/doc/iterm5.png" width="300"> <img src="/doc/iterm6.png" width="300">

Copy your public key to servers

```sh
node setup/sshCopy.js
```

> Now you can ssh into servers.

Configure ansible

```sh
ansible-config init --disabled > ansible.cfg
```

```
# ansible.cfg
remote_user=rendering
interpreter_python=auto_silent
display_skipped_hosts=False
```

list of inventory

```sh
ansible-inventory -i setup/inventory --list
```

ping

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

Configure remote host

```sh
ansible-playbook -i setup/inventory_temp setup/ansible/configure.yml
```

Change .env

```sh
ansible-playbook -i setup/inventory_temp setup/ansible/actions.yml -e "actions=change_env"
```

Change prompt

```sh
ansible-playbook -i setup/inventory_temp setup/ansible/actions.yml -e "actions=zsh_prompt"
```

> Configure `NODE_ENV`, `QUEUE_URL`, `GMAIL_USERNAME`, `GMAIL_APP_PASSWORD` and others if necessary.

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

# Server status

```sh
pm2 start dev/pingServersCommand.js --cron-restart="*/10 * * * *"
pm2 restart pingServersCommand --cron-restart="*/10 * * * *"
```
