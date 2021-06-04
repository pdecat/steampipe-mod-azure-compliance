
# Azure Compliance Scanning Tool

110+ checks covering industry defined security best practices for Azure. 

**Includes full support for the CIS v1.3 Azure Benchmarks**:

![image](https://raw.githubusercontent.com/turbot/steampipe-mod-azure-compliance/main/docs/azure_cis_v130_console.png)

## Azure control coverage
1. [Identity and Access Management](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.cis_v130_1)
2. [Security Center](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.cis_v130_2)
3. [Storage Accounts](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.cis_v130_3)
4. [Database Services](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.cis_v130_4)
5. [Logging and Monitoring](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.cis_v130_5)
6. [Networking](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.cis_v130_6)
7. [Virtual Machines](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.cis_v130_7)
8. [Other Security Considerations](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.cis_v130_8)
9. [AppService](https://hub.steampipe.io/mods/turbot/azure_compliance/controls/benchmark.cis_v130_9)

## Quick start

1) Download and install Steampipe (https://steampipe.io/downloads).

2) Install the Azure plugin with [Steampipe](https://steampipe.io):
```sh
steampipe plugin install azure
```

3) Configure your Azure CLI credentials
```sh
az login
```

4) Clone this repo:
```sh
git clone git@github.com:turbot/steampipe-mod-azure-compliance
cd steampipe-mod-azure-compliance
```

5) Run all the benchmarks:
```shell
steampipe check all
```
### Other stuff to try out

Run an individual benchmark:
```shell
steampipe check benchmark.cis_v130_6
```

View all controls in this mod:
```sh
steampipe query "select resource_name from steampipe_control;"
```

Run a specific control:
```shell
steampipe check control.cis_v130_4_3_5
```

## Contributing

If you have an idea for additional compliance controls, or just want to help maintain and extend this mod ([or others](https://github.com/topics/steampipe-mod)) we would love you to join the community and start contributing. (Even if you just want to help with the docs.)

- **[Join our Slack community →](https://join.slack.com/t/steampipe/shared_invite/zt-oij778tv-lYyRTWOTMQYBVAbtPSWs3g)**
- **[Mod developer guide →](https://steampipe.io/docs/steampipe-mods/writing-mods.md)**

Please see the [contribution guidelines](https://github.com/turbot/steampipe/blob/main/CONTRIBUTING.md) and our [code of conduct](https://github.com/turbot/steampipe/blob/main/CODE_OF_CONDUCT.md). All contributions are subject to the [Apache 2.0 open source license](https://github.com/turbot/steampipe-mod-aws-compliance/blob/main/LICENSE).

`help wanted` issues:
- [Steampipe](https://github.com/turbot/steampipe/labels/help%20wanted)
- [Azure Mod](https://github.com/turbot/steampipe-mod-azure-compliance/labels/help%20wanted)
