all: _gokrazy/extrafiles_arm64.tar _gokrazy/extrafiles_amd64.tar

_gokrazy/extrafiles_amd64.tar:
	mkdir -p _gokrazy/extrafiles_amd64/usr/local/bin
	curl -fsSL https://github.com/containerd/containerd/releases/download/v2.1.3/containerd-static-2.1.3-linux-amd64.tar.gz | tar xzv --strip-components=1 -C _gokrazy/extrafiles_amd64/usr/local/bin/ --exclude containerd-stress
	curl -fsSL -o _gokrazy/extrafiles_amd64/usr/local/bin/runc https://github.com/opencontainers/runc/releases/download/v1.3.0/runc.amd64
	chmod +x _gokrazy/extrafiles_amd64/usr/local/bin/runc
	cd _gokrazy/extrafiles_amd64 && tar cf ../extrafiles_amd64.tar *
	rm -rf _gokrazy/extrafiles_amd64

_gokrazy/extrafiles_arm64.tar:
	mkdir -p _gokrazy/extrafiles_arm64/usr/local/bin
	curl -fsSL https://github.com/containerd/containerd/releases/download/v2.1.3/containerd-static-2.1.3-linux-arm64.tar.gz | tar xzv --strip-components=1 -C _gokrazy/extrafiles_arm64/usr/local/bin/ --exclude containerd-stress
	curl -fsSL -o _gokrazy/extrafiles_arm64/usr/local/bin/runc https://github.com/opencontainers/runc/releases/download/v1.3.0/runc.arm64
	chmod +x _gokrazy/extrafiles_arm64/usr/local/bin/runc
	cd _gokrazy/extrafiles_arm64 && tar cf ../extrafiles_arm64.tar *
	rm -rf _gokrazy/extrafiles_arm64

clean:
	rm -f _gokrazy/extrafiles_*.tar
