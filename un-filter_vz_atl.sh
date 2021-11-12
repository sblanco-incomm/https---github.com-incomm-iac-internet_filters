#!/bin/bash
ansible-playbook pb_remove_66_filter.yml -i atl_ir_inventory.ini -l usatl02_ic_vz
dir ./results
