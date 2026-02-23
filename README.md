# BNG Blaster Docker Image

Unofficial Docker image for [RTBrick BNG Blaster](https://github.com/rtbrick/bngblaster) - an open-source network tester for routing and access protocols.

> **Not affiliated with or endorsed by RtBrick.**

## Building

```bash
docker build -t veesixnetworks/bngblaster:0.9.26 .

# Build a different version
docker build --build-arg BNGBLASTER_VERSION=0.9.25 -t veesixnetworks/bngblaster:0.9.25 .
```

## License

BNG Blaster is licensed under the [BSD 3-Clause License](https://github.com/rtbrick/bngblaster/blob/main/LICENSE) by RtBrick. See [LICENSE-bngblaster](LICENSE-bngblaster) for details.

This Docker packaging is maintained by [veesix ::networks / Brandon Spendlove](https://github.com/veesixnetworks).
