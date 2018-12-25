VERSION=0.0.2
TAG=slavik0/docker-alpine-anon-proxy

run: build
	docker run -p 0.0.0.0:3128:3128 --name $(TAG) --rm $(TAG)

build:
	docker build -t $(TAG):latest -t $(TAG):$(VERSION) .

clean:
	docker images | grep -E "$(TAG)" | awk '{print $$3}' | xargs docker rmi -f

push:
	docker push $(TAG):latest
	docker push $(TAG):$(VERSION)
