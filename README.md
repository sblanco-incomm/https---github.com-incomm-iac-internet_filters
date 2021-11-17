<h1 id="snow-normal_chg-api">Playbooks to filter and un-filter internet BGP peering.</h1>

## Automate the application and removal of a filter to an Internet provider on a cisco device.

Two playbooks have been created to automate these activities:

pb_add_66_filter.yml - This playbook adds the as-path filter 66 in an out to a bgp peering, base on the information provided on the inventory file.
pb_remove_66_filter.yml - This playbook removess the as-path filter 66 in an out to a bgp peering, base on the information provided on the inventory file.
The inventory file contains the information about the switches involved in the change as well as other parameters needed. This is an example of an inventory file.

cx_ic_inventory.ini	

[usat1_ic_eqx]

usat101-ic01 ansible_host=10.72.208.9 ansible_network_os=nxos device=1 asn=398453 neig=149.97.135.29

usat101-ic02 ansible_host=10.72.208.10 ansible_network_os=nxos device=2 asn=398453 neig=149.97.135.33

[usdc12_ic_eqx]

usdc1201-ic01 ansible_host=10.72.216.9 ansible_network_os=nxos device=1 asn=399257 neig=149.97.228.21

usdc1201-ic02 ansible_host=10.72.216.10 ansible_network_os=nxos device=2 asn=399257 neig=149.97.228.25

[usat1_ic_vz]

usat101-ic01_v ansible_host=10.72.208.9 ansible_network_os=nxos device=1 asn=398453 neig=204.148.186.233

[usdc12_ic_vz]

usdc1201-ic01_v ansible_host=10.72.216.9 ansible_network_os=nxos device=1 asn=399257 neig=204.148.79.197

[eqx:children]

usat1_ic_eqx

usdc12_ic_eqx


[vz:children]

usat1_ic_vz

usdc12_ic_vz


[vz:vars]

peer_template = VZ_Internet


[eqx:vars]

peer_template = EQX_Internet


In order to facilitate the execution of this changes, several bash files were created, specifically for Internet providers used in carrier exchange datacenters.

## List of bash files.

filter_eqx_at1.sh - Add the 66 filters to both Internet Core switches in AT1 on the connections to Equinix.

un-filter_eqx_at1.sh - Remove the 66 filters to both Internet Core switches in AT1 on the connections to Equinix.

filter_vz_at1.sh - Add the 66 filters Internet Core switch 1  in AT1 on the connections to Verizon.

un-filter_vz_at1.sh - Remove the 66 filters Internet Core switch 1  in AT1 on the connections to Verizon.

filter_eqx_dc12.sh - Add the 66 filters to both Internet Core switches in DC12 on the connections to Equinix.

un-filter_eqx_dc12.sh - Remove the 66 filters to both Internet Core switches in DC12 on the connections to Equinix.

filter_vz_dc12.sh - Add the 66 filters Internet Core switch 1  in DC12 on the connections to Verizon.

un-filter_vz_at1.sh - Remove the 66 filters Internet Core switch 1  in DC12 on the connections to Verizon.

filter_h5_den.sh - Add the 66 filters Internet Core switches in Denver on the connections to H5.

un-filter_h5_den.sh - Remove the 66 filters Internet Core switches in Denver on the connections to H5.

filter_l3_den.sh - Add the 66 filters Internet Core switches in Denver on the connections to Level 3.

un-filter_l3_den.sh - Remove the 66 filters Internet Core switches in Denver on the connections to Level 3.

filter_l3_atl.sh - Add the 66 filters Internet Core switches in 250 on the connections to Level 3.

un-filter_l3_atl.sh - Remove the 66 filters Internet Core switches in 250 on the connections to Level 3.

filter_vz_atl.sh - Add the 66 filters Internet Core switches in 250 on the connections to Verizon.

un-filter_vz_atl.sh - Remove the 66 filters Internet Core switches in 250 on the connections to Verizon.

filter_L3_qts.sh - Add the 66 filters Internet Core switches in QTS on the connections to Level 3.

un-filter_L3_qts.sh - Remove the 66 filters Internet Core switches in QTS on the connections to Level 3.

filter_ntt_qts.sh - Add the 66 filters Internet Core switches in QTS on the connections to NTT.

un-filter_ntt_qts.sh - Remove the 66 filters Internet Core switches in QTS on the connections to NTT.


All files generate outputs on the folder results.

## Procedure to apply or remove the filter to an Internet Provider.

1.- ssh to the ansible server 10.41.128.219 with the credentials svc_neteng (network teams).

2.- Move to the directory ansible/internet_filters  cd ansible/internet_filters

3.- Execute the bash file that correspond to the required action. (see table above).

4.- Using WinCSP collect result files from the results directory.

5.-	Validate the routing from and to Internet, using the results files and other tools like Thousand eyes.

