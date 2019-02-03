VERSION=0.0.3
TAG=slavik0/docker-alpine-anon-proxy
NAME:=$(shell echo $(TAG) | sed 's/\//-/g')

run: build
	docker run -p 0.0.0.0:3128:3128 --name $(NAME) -e PROXY_LIST="$(PROXY_LIST)" --rm $(TAG)

build:
	docker build -t $(TAG):latest -t $(TAG):$(VERSION) .

clean:
	docker images | grep -E "$(TAG)" | awk '{print $$3}' | xargs docker rmi -f

push:
	docker push $(TAG):latest
	docker push $(TAG):$(VERSION)
