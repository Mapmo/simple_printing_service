REPO_NAME = mapmo
IMAGE_NAME = simple_printing_service
TAG_VERSION = 0.0.0
SCRIPT_NAME = simple_printing_service.py

build:
	docker build -t "${REPO_NAME}/${IMAGE_NAME}:${TAG_VERSION}" .

start:
	python3 ${SCRIPT_NAME} -n SHELL -i 2

start.container:
	docker run -t "${REPO_NAME}/${IMAGE_NAME}:${TAG_VERSION}" python3 simple_printing_service.py -i 1

start.cluster:
	kubectl apply -f k8s/simple-printing-service.yaml

stop.cluster:
	kubectl delete -f k8s/simple-printing-service.yaml