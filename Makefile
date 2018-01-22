TARGET?=binary

build:
	docker build -t jandubois/cf-buildpack-packager .

run:
	docker run -it --rm -v $(PWD):/out jandubois/cf-buildpack-packager $(TARGET)
