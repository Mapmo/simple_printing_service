REPO_NAME = mapmo
IMAGE_NAME = simple_printing_service
TAG_VERSION = 0.0.0
SCRIPT_NAME = simple_printing_service.py
TEST_FILE = tests.py
K8S_DIR = k8s
HELM_DIR = simple_printing_service
HELM_VALUES = ${HELM_DIR}/values.y
HELM_RELEASE = simple

help:
	@python3 ${SCRIPT_NAME} -h

start:
	@python3 ${SCRIPT_NAME} -n SHELL -i 2

build:
	@docker build -t "${REPO_NAME}/${IMAGE_NAME}:${TAG_VERSION}" .

container.start:
	@docker run -t "${REPO_NAME}/${IMAGE_NAME}:${TAG_VERSION}" python3 simple_printing_service.py -i 1

k8s.start:
	@kubectl apply -f ${K8S_DIR}

k8s.stop:
	@kubectl delete -f ${K8S_DIR}

helm.start:
	@helm install ${HELM_RELEASE} ${HELM_DIR} --values ${HELM_VALUES}

helm.upgrade:
	@helm upgrade ${HELM_RELEASE} ${HELM_DIR} --values ${HELM_VALUES}

helm.stop:
	@helm uninstall ${HELM_RELEASE}

install:
	@pip3 install -r requirements.txt

test:
	@pytest ${TEST_FILE}

tfinit:
	@cd terraform && terraform init

tfplan:
	@cd terraform && terraform plan

tfapply:
	@cd terraform && terraform apply

tfdestroy:
	@cd terraform && terraform destroy

style:
	@autopep8 -ir .
	@terraform fmt -recursive