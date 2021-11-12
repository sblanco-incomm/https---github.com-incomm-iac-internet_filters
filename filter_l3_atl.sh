#!/bin/bash
ansible-playbook pb_add_66_filter.yml -i atl_ir_inventory.ini -l usatl02_ic_l3
dir ./results
