setup-env-template:
	sed s/TF_VAR_env/$(ENV)/ < ./infrastructure/backend.s3.tfbackend.template > ./infrastructure/backend.s3.tfbackend

setup-infrastructure:
	sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
	wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
	gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
	echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com focal main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
	sudo apt update
	sudo apt-get install terraform

install-aws-cli:
	mkdir -p downloads
	sudo apt install unzip
	cd downloads && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && sudo ./aws/install

install-postgres:
	sudo apt-get update -y
	sudo apt install postgresql -y