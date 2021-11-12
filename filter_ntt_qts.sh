#!/bin/bash
ansible-playbook pb_add_66_filter.yml -i qts_ic_inventory.ini -l usqts_ic_ntt
dir ./results
