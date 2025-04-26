#!/usr/bin/env bash

sudo cp target/release/niri /usr/local/bin/
sudo cp resources/niri-session /usr/local/bin/
sudo cp resources/niri.desktop /usr/local/share/wayland-sessions/
sudo cp resources/niri-portals.conf /usr/local/share/xdg-desktop-portal/
sudo cp resources/niri.service /etc/systemd/user/
sudo cp resources/niri-shutdown.target /etc/systemd/user/
sudo cp resources/dinit/niri /etc/dinit.d/user/
sudo cp resources/dinit/niri-shutdown /etc/dinit.d/user/
