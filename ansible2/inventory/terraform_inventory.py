#!/usr/bin/env python3
import json
import subprocess

# Call terraform and get outputs
tf_output = subprocess.check_output(
    ["terraform", "output", "-json"],
    text=True
)

data = json.loads(tf_output)

# Build hosts dict
hosts = {
    data["webserverip"]["value"]: {}
}

# Build inventory
inventory = {
    "all": {
        "hosts": hosts
    },
    "_meta": {
        "hostvars": {}
    }
}

# Print inventory to stdout
print(json.dumps(inventory))
