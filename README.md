# cf-buildpack-packager-docker

This repository contains a tool to package cached (offline) versions of
Cloud Foundry buildpacks. They can be used to improve staging performance,
or to make staging possible on air-gapped installations.

The tools is packaged as a docker image, so it can be used on any system
with Docker support, not requiring any other prerequisites.

Examples:

The generated buildpacks will be put into the current working directory `$PWD`
and can be uploaded to a CF instance via `cf create-buildpack ...`

## Build current SUSE ruby buildpack

```
docker run -it --rm -v $(PWD):/out splatform/cf-buildpack-packager SUSE ruby
```

## Build older version of SUSE ruby buildpack

```
docker run -it --rm -v $(PWD):/out splatform/cf-buildpack-packager SUSE ruby v1.7.7.1
```

## Build current version of all SUSE buildpacks

```
docker run -it --rm -v $(PWD):/out splatform/cf-buildpack-packager SUSE all
```

It is not possible to specify older version numbers when building *all* buildpacks.

## Build current cloudfoundry go buildpack

Also don't prompt to accept the disclaimer:

```
docker run -it --rm -v $(PWD):/out splatform/cf-buildpack-packager --accept-external-binaries cloudfoundry go
```

