#!/bin/bash
ansible-playbook pb_add_66_filter.yml -i cx_ic_inventory.ini -l usdc12_ic_vz
dir ./results
