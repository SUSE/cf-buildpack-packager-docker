# cf-buildpack-packager-docker

This repository contains a tool to package cached (offline) versions of
Cloud Foundry buildpacks. They can be used to improve staging performance,
or to make staging possible on air-gapped installations.

The tools is packaged as a docker image, so it can be used on any system
with Docker support, not requiring any other prerequisites.

## Examples:

The generated buildpacks will be put into the current working directory `$PWD`
and can be uploaded to a CF instance via `cf create-buildpack ...`

### Build latest released SUSE ruby buildpack

```
docker run -it --rm -v $(PWD):/out splatform/cf-buildpack-packager SUSE ruby
```

### Build older version of SUSE ruby buildpack

```
docker run -it --rm -v $(PWD):/out splatform/cf-buildpack-packager SUSE ruby v1.7.7.1
```

You can get the list of currently installed buildpacks from your Cloud Foundry
instance via:

```
cf buildpacks
```

### Build latest released versions of all SUSE buildpacks

```
docker run -it --rm -v $(PWD):/out splatform/cf-buildpack-packager SUSE all
```

It is not possible to specify older version numbers when building *all* buildpacks.

### Build latest released cloudfoundry go buildpack

Also don't prompt to accept the disclaimer:

```
docker run -it --rm -v $(PWD):/out splatform/cf-buildpack-packager --accept-external-binaries cloudfoundry go
```


## Usage

```
package [--accept-external-binaries] ORG <all | LANGUAGE> [TAG]
```

ORG is the github organization hosting the buildpack repos, i.e. "cloudfoundry"
or "SUSE".


## Disclaimer

Some Cloud Foundry buildpacks can reference binaries with proprietary or
mutually incompatible open source licenses which cannot be distributed together
as offline/cached buildpack archives. Operators who wish to package and maintain
offline buildpacks will be responsible for any required licensing or export
compliance obligations.

For automation purposes you can use the `--accept-external-binaries` option to
accept this disclaimer without the interactive prompt.
