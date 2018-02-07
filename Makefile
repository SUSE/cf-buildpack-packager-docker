TARGET?=binary

build: clean
	docker build -t splatform/cf-buildpack-packager .

publish: build
	docker tag splatform/cf-buildpack-packager splatform/cf-buildpack-packager:$(shell git describe --tags --abbrev=0)
	docker push splatform/cf-buildpack-packager:$(shell git describe --tags --abbrev=0)
	docker push splatform/cf-buildpack-packager

clean:
	-rm *.zip 2> /dev/null

run:
	docker run -it --rm -v $(PWD):/out splatform/cf-buildpack-packager --accept-external-binaries SUSE $(TARGET)
