TARGET?=binary

build: clean
	docker build -t splatform/cf-buildpack-packager .

clean:
	-rm *.zip 2> /dev/null

run:
	docker run -it --rm -v $(PWD):/out splatform/cf-buildpack-packager --accept-external-binaries $(TARGET)
