#!/bin/bash
ansible-playbook pb_remove_66_filter.yml -i cx_ic_inventory.ini -l usqts_ic_l3
dir ./results
