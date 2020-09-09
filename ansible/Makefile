user ?= $(shell whoami)

# Setup ansible in a python virtual environment
.PHONY: venv
venv:
	pip install virtualenv
	virtualenv .venv-ansible
	. .venv-ansible2/bin/activate && \
               pip install --upgrade -r requirements.txt

.PHONY: setup
setup:
	git submodule update --init --recursive

.PHONY: gcloud-instances
gcloud-instances:
	bash ../scripts/gcloud-create-instances.sh

# k8s-users
.PHONY: k8s-users
k8s-users: #setup
	ansible-playbook k8s-users.yml \
		-u $(user) \
		$(custom-args)

# k8s
.PHONY: k8s
k8s: #setup
	ansible-playbook k8s.yml \
		-u $(user) \
		$(custom-args)
