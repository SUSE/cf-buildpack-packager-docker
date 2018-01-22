TARGET?=binary

build: clean
	docker build -t jandubois/cf-buildpack-packager .

clean:
	-rm *.zip 2> /dev/null

run:
	docker run -it --rm -v $(PWD):/out jandubois/cf-buildpack-packager --i-agree $(TARGET)
