# Easy SCP
#### A shortcut to send and receive your files simply with SCP.

<p>In order to be able to use Easy SCP correctly, make sure you have correctly installed Easy SSH ([link available here](https://github.com/hadidotsh/easy-ssh))</p>

### Install :
<p>Just pass this lines in your shell :</p>

```bash
git clone https://github.com/HadiDotSh/easy-scp && cd easy-scp && bash install.sh
```
<p>Then, add an alias to your bashrc/zshrc file like :</p>

```bash
vim ~/.bashrc   # Or ~/.zshrc
# And add :
alias escp="bash ~/.escp.sh"
# Save and exit the file, then reload your bashrc or zshrc :
source ~/.bashrc # Or ~/.zshrc
```

### How to use it :

```bash
escp ${serverName} ${send/receive} ${file/folder} ${destination}

# Example :
escp MyServer send script.sh /home/hadi
# The "script.sh" file will be sent to the server named "MyServer" and stored in the /home/hadi folder
```