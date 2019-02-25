TARGET?=binary

build: clean
	docker build -t splatform/cf-buildpack-packager .

tagname = $(shell date "+%Y-%m-%d-g`git rev-parse --short HEAD`")

tagname:
	@echo $(call tagname)

tag: build
	# Make sure there are no uncommitted changes when tagging the image
	git diff --no-ext-diff --quiet
	git diff --no-ext-diff --cached --quiet
	docker tag splatform/cf-buildpack-packager splatform/cf-buildpack-packager:$(call tagname)

publish: tag
	docker push splatform/cf-buildpack-packager:$(call tagname)
	docker push splatform/cf-buildpack-packager

clean:
	-rm -f ./*.zip 2> /dev/null

run:
	docker run -it --rm -v $(PWD):/out splatform/cf-buildpack-packager --accept-external-binaries SUSE $(TARGET)
