echo "Install http://prenagha.github.io/launchbar/updates.html first"
echo "Install https://s3.amazonaws.com/renaghan/lbdist/Things.lbaction second"
echo "Install https://prenagha.github.io/launchbar/dismiss.html third"

echo "Setting up LaunchBar GitHub plugin from https://github.com/bswinnerton/launchbar-github"

mkdir -p ~/Library/Application\ Support/LaunchBar/Actions/
git clone https://github.com/bswinnerton/launchbar-github ~/Library/Application\ Support/LaunchBar/Actions/github.lbaction

git clone https://github.com/hlissner/lb6-actions ~/Library/Application\ Support/LaunchBar/Actions/

echo "Enabling VPN action"
ln -s ~/Library/Application\ Support/LaunchBar/Actions/lb6-actions/VPN.lbaction ~/Library/Application\ Support/LaunchBar/Actions/

echo "Enabling Chrome Tabs action"
ln -s ~/Library/Application\ Support/LaunchBar/Actions/lb6-actions/Chrome\ Tabs.lbaction ~/Library/Application\ Support/LaunchBar/Actions/


