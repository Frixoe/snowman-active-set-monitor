# snowman-active-set-monitor
Monitor the active of blockchains running the `avalanchego` client.

## Setup
### 1. Install
Run the following commands to get everything setup.
```
git clone https://github.com/Frixoe/snowman-active-set-monitor.git
cd snowman-active-set-monitor
nano monitor_active_set.sh
```
### 2. Edit
Now edit the following in the `monitor_active_set.sh` script:
```
VALIDATOR_NODE_ID="<YOUR VALIDATOR'S NODE ID>"
API_KEY="<YOUR TELEGRAM BOT API KEY>"
CHANNEL_ID="<YOUR TELEGRAM GROUP'S CHAT ID>"
```
### 3. Move `systemd` service file
Now, edit the `systemd` service file to make sure the user and the execution path is correct. Then move it:
```
mv active-set-monitor.service /etc/systemd/system/
```
### 4. Run
Now, run the following:
```
sudo systemctl daemon-reload
sudo systemctl start active-set-monitor.service
```
And you should now be monitoring your validator's active set participation!
