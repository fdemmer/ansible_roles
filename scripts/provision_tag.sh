#!/bin/bash
# run ansible provisioning in vagrant, but only the given tag...
#
# eg:
#   ./provision_tag.sh stop_webapp
#

export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook \
    --private-key=.vagrant/machines/default/virtualbox/private_key \
    -i provisioning/inventory \
    -l vagrant \
    -u vagrant \
    --tags="$1" \
    --extra-vars '{"disabled_by_default": false}' \
    -vvvv \
    provisioning/site.yml
