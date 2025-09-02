## containerd for gokrazy

This package contains the static build of https://github.com/containerd/containerd

This is an alternative to [podman in gokrazy](https://gokrazy.org/packages/docker-containers/). It's larger but has less dependencies.

### Usage

```
gok add github.com/ascension-association/containerd
gok update
```

The sections below assume you are logged into to your gokrazy device using
[breakglass](https://github.com/gokrazy/breakglass).


#### Run a container

```
ctr image pull docker.io/library/alpine:latest && ctr run --net-host --rm -t docker.io/library/alpine:latest my-container-name
```

#### Optional: tmpfs

By default, containers are stored on disk (`/var` is a symlink to `/perm/var` on
the permanent data partition). If you only want to try something out without
keeping the containers around across reboots, it is faster to work in RAM:

```
mount -t tmpfs tmpfs /var
```

#### Optional: nerdctl

While the `ctr` tool is [bundled together with containerd](https://github.com/containerd/containerd/blob/main/docs/getting-started.md#interacting-with-containerd-via-cli), it should be noted the `ctr` tool is solely made for debugging containerd. The [nerdctl](https://github.com/containerd/nerdctl) tool provides a stable and human-friendly user experience.
