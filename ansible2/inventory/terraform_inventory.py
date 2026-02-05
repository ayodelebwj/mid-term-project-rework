#!/usr/bin/env python3
import json
import subprocess

# Call terraform and get outputs
tf_output = subprocess.check_output(
    ["terraform", "output", "-json"],
    text=True
)

data = json.loads(tf_output)

web_ip = data["webserverip"]["value"]
app_ip  = data["app_private_ip"]["value"]

inventory = {
    "web": {"hosts": {web_ip: {}}},
    "app":  {"hosts": {app_ip: {}}},
    "all": {"children": ["web", "app"]},
    "_meta": {"hostvars": {}}
}

# Print inventory to stdout
print(json.dumps(inventory))
