
pull:
	docker rmi $(docker images -q --filter dangling=true) ; \
	docker pull $(REGISTRY_URL)/$(IMAGE):$(TAG)

tag:
	docker tag $(IMAGE) $(REGISTRY_URL)/$(IMAGE):$(GO_PIPELINE_LABEL)
	docker tag $(IMAGE) $(REGISTRY_URL)/$(IMAGE):latest

push:
	docker push $(REGISTRY_URL)/$(IMAGE):$(GO_PIPELINE_LABEL)
	docker push $(REGISTRY_URL)/$(IMAGE):latest
	docker rmi $(IMAGE)
	docker rmi $(REGISTRY_URL)/$(IMAGE):$(GO_PIPELINE_LABEL)
	docker rmi $(REGISTRY_URL)/$(IMAGE):latest