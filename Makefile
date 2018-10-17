VERSION=0.0.1
TAG=alpine-anon-proxy

run: build
	docker run -p 0.0.0.0:3128:3128 --name $(TAG) --rm $(TAG)

build:
	docker build -t $(TAG):latest -t $(TAG):$(VERSION) .

clean:
	docker images | grep -E "$(TAG)|<none>" | awk '{print $3}' | xargs docker rmi -f
