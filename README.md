# ansible-role-install-k8s

# only tested in ubuntu

Ansible Role for install K8s (one master and two workers)

pip install -r requirements.txt

```ansible-playbook k8s.yml
```

adjust the hosts file as you need with the IPs of the nodes or your dynamic inventory from AWS for example (tag_k8s_master or tag_k8s_worker)

If you want to manage the machines with no user and pass, run the playbook ```k8s-uers.yml``` with the options ```-k -K``` for the first time to add you pubkey (put the pubkey in the roles/users/files with the suffix .pub)
