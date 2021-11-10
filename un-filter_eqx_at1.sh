#!/bin/bash
ansible-playbook pb_remove_66_filter.yml -i cx_ic_inventory.ini -l usat1_ic_eqx
dir ./results
