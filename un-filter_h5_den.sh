#!/bin/bash
ansible-playbook pb_remove_66_filter.yml -i den_ic_inventory.ini -l usden_ic_h5
dir ./results
