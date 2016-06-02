IMAGE_FROM=$(REGISTRY_FROM_URL)/$(IMAGE):$(TAG)
IMAGE_TO=$(REGISTRY_TO_URL)/$(IMAGE)

pull:
	docker rmi $(docker images -q --filter dangling=true) ; \
	docker pull $(IMAGE_FROM)

tag:
	docker tag $(IMAGE_FROM) $(IMAGE_TO):$(GO_PIPELINE_LABEL)
	docker tag $(IMAGE_FROM) $(IMAGE_TO):latest

push:
	docker push $(IMAGE_TO):$(GO_PIPELINE_LABEL)
	docker push $(IMAGE_TO):latest
	docker rmi $(IMAGE_FROM)
	docker rmi $(IMAGE_TO):$(GO_PIPELINE_LABEL)
	docker rmi $(IMAGE_TO):latest
