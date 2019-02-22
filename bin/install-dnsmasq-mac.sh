#!/bin/bash
  
brew up
brew install dnsmasq
sudo cp $(brew list dnsmasq | grep /homebrew.mxcl.dnsmasq.plist$) /Library/LaunchDaemons/
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

tee /usr/local/etc/dnsmasq.conf >/dev/null <<EOF
address=/local/127.0.0.1
EOF

sudo brew services restart dnsmasq
sudo mkdir -p /etc/resolver

sudo tee /etc/resolver/local >/dev/null <<EOF
nameserver 127.0.0.1
EOF

