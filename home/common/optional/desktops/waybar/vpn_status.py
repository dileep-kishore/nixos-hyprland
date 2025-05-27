#!/usr/bin/env python3

import subprocess


def get_vpn_status():
    """
    Get the status of the OpenVPN service and return a formatted string.
    The output will be one of the following:
    - "active" if the VPN is connected
    - "inactive" if the VPN is disconnected
    - "failed" if the VPN connection failed
    - "unknown" if the status is not recognized
    """
    cmd = ["systemctl", "is-active", "openvpn-homeVPN.service"]
    process = subprocess.run(cmd, capture_output=True, text=True)
    output = process.stdout.strip()
    return output


vpn_status = get_vpn_status()
if vpn_status == "active":
    display = "<i> </i>"
else:
    display = "<i> </i>"
print(display)
