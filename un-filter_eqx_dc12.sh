#!/bin/bash
ansible-playbook pb_remove_66_filter.yml -i cx_ic_inventory.ini -l usdc12_ic_eqx
dir ./results
