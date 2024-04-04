APP=$(shell basename $(shell git remote get-url origin))
REGESTRY=gcr.io/devops-course-419217
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=linux
TARGETARCH=amd64

format:
	gofmt -s -w ./

get:
	go get

lint:
	staticcheck

build_linux_amd64: format get
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -o telegram_bot_on_go -ldflags "-X="github.com/lytvynov-kostiantyn/telegram_bot_on_go/cmd.appVersion=${VERSION}

build_linux_arm: format get
	CGO_ENABLED=0 GOOS=linux GOARCH=arm go build -v -o telegram_bot_on_go -ldflags "-X="github.com/lytvynov-kostiantyn/telegram_bot_on_go/cmd.appVersion=${VERSION}

build_darwin_amd64: format get
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -v -o telegram_bot_on_go -ldflags "-X="github.com/lytvynov-kostiantyn/telegram_bot_on_go/cmd.appVersion=${VERSION}

build_windows_amd64: format get
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -v -o telegram_bot_on_go -ldflags "-X="github.com/lytvynov-kostiantyn/telegram_bot_on_go/cmd.appVersion=${VERSION}

image:
	docker build . -t ${REGESTRY}/${APP}:${VERSION}-${TARGETARCH}

dive:
	dive --ci --lowestEfficiency=0.95 ${REGESTRY}/${APP}:${VERSION}-${TARGETARCH}

run:
	docker run -d --name telegram_bot_on_GO ${REGESTRY}/${APP}:${VERSION}-${TARGETARCH}

push:
	docker push ${REGESTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	docker rmi ${REGESTRY}/${APP}:${VERSION}-${TARGETARCH}
