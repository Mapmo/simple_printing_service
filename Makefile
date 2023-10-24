REPO_NAME = mapmo
IMAGE_NAME = simple_printing_service
TAG_VERSION = 0.0.0
SCRIPT_NAME = simple_printing_service.py
TEST_FILE = tests.py
K8S_DIR = k8s/simple-printing-service.yaml


build:
	docker build -t "${REPO_NAME}/${IMAGE_NAME}:${TAG_VERSION}" .

start:
	python3 ${SCRIPT_NAME} -n SHELL -i 2

help:
	python3 ${SCRIPT_NAME} -h

start.container:
	docker run -t "${REPO_NAME}/${IMAGE_NAME}:${TAG_VERSION}" python3 simple_printing_service.py -i 1

start.cluster:
	kubectl apply -f ${K8S_DIR}

stop.cluster:
	kubectl delete -f ${K8S_DIR}

install:
	pip3 install -r requirements.txt

test:
	pytest ${TEST_FILE}