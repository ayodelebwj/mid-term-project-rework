#!/usr/bin/env python3
import json
import subprocess

# Get Terraform output
tf_output = subprocess.check_output(["terraform", "output", "-json"])
data = json.loads(tf_output)

# Build Ansible inventory format
inventory = {"all": {"hosts": data["web_ips"]["value"]}}

print(json.dumps(inventory))
