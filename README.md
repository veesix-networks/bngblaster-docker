# BNG Blaster Docker Image

Unofficial Docker image for [RTBrick BNG Blaster](https://github.com/rtbrick/bngblaster) - an open-source network tester for routing and access protocols.

> **Not affiliated with or endorsed by RtBrick.**

## Building

```bash
docker build -t veesixnetworks/bngblaster:0.9.30 .

# Build a different version
docker build --build-arg BNGBLASTER_VERSION=0.9.25 -t veesixnetworks/bngblaster:0.9.25 .
```

## Test Configs

Pre-built configs for testing osvbng BNG scenarios are in `configs/`.

### IPoE Scenarios

| Config | VLAN Model | Stack | Use Case |
|--------|-----------|-------|----------|
| `ipoe-n1-basic.json` | N:1 | IPv4 only | Smoke test with traffic generation |
| `ipoe-n1-dualstack.json` | N:1 | Dual-stack | N:1 with DHCPv6 IA-NA/PD |
| `ipoe-qinq-dualstack.json` | Q-in-Q 1:1 | Dual-stack | Per-subscriber VLANs |

### PPPoE Scenarios

| Config | VLAN Model | Stack | Use Case |
|--------|-----------|-------|----------|
| `pppoe-qinq-dualstack.json` | Q-in-Q 1:1 | Dual-stack | LCP/IPCP/IP6CP |

Override session count with `-c`:

```bash
bngblaster -C /config/ipoe-qinq-dualstack.json -c 1000
```

### VLAN Models

- **N:1** - Multiple subscribers share one S-VLAN, identified by MAC. No inner VLAN.
- **Q-in-Q 1:1** - Each subscriber gets a unique S-VLAN + C-VLAN pair. `outer-vlan` is the S-VLAN, `inner-vlan` is the C-VLAN.

### Access-Line Tags

All configs include access-line attributes for subscriber identification:

- DHCPv4: Option 82 (Agent Circuit ID / Agent Remote ID)
- DHCPv6: LDRA with Interface-ID (Option 18) and Remote-ID (Option 37)
- **Circuit-ID / Interface-ID**: `eth 0/1/2/3/{session}:100.{session}` - simulates DSLAM port identifiers
- **Remote-ID**: `DSLAM-{session}` - simulates DSLAM hostname

## Containerlab Integration

This image is used as the subscriber simulator in the [osvbng containerlab demo topology](https://github.com/srl-labs/containerlab/tree/main/lab-examples/osvbng01). The demo deploys a full BNG environment with osvbng, a core router (FRR), and BNG Blaster as subscribers, all wired together automatically.

See the `containerlab/lab-examples/osvbng01/` directory for the topology file and per-node configs.

## License

BNG Blaster is licensed under the [BSD 3-Clause License](https://github.com/rtbrick/bngblaster/blob/main/LICENSE) by RtBrick. See [LICENSE-bngblaster](LICENSE-bngblaster) for details.

This Docker packaging is maintained by [veesix ::networks / Brandon Spendlove](https://github.com/veesixnetworks).
