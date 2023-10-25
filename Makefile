REPO_NAME = mapmo
IMAGE_NAME = simple_printing_service
TAG_VERSION = 0.0.0
SCRIPT_NAME = simple_printing_service.py
TEST_FILE = tests.py
K8S_DIR = k8s/simple_printing_service.yaml
HELM_DIR = simple_printing_service
HELM_RELEASE = simple

build:
	docker build -t "${REPO_NAME}/${IMAGE_NAME}:${TAG_VERSION}" .

start:
	python3 ${SCRIPT_NAME} -n SHELL -i 2

help:
	python3 ${SCRIPT_NAME} -h

container.start:
	docker run -t "${REPO_NAME}/${IMAGE_NAME}:${TAG_VERSION}" python3 simple_printing_service.py -i 1

k8s.start:
	kubectl apply -f ${K8S_DIR}

k8s.stop:
	kubectl delete -f ${K8S_DIR}

helm.start:
	helm install ${HELM_RELEASE} ${HELM_DIR}

helm.upgrade:
	helm upgrade ${HELM_RELEASE} ${HELM_DIR}

helm.stop:
	helm uninstall ${HELM_RELEASE}

install:
	pip3 install -r requirements.txt

test:
	pytest ${TEST_FILE}