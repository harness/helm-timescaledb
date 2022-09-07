# timescaledb

![Version: 0.2.4](https://img.shields.io/badge/Version-0.2.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://harness.github.io/helm-common | harness-common | 1.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| global.storageClassName | string | `""` |  |
| image.digest | string | `""` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"timescale/timescaledb-ha"` |  |
| image.tag | string | `"pg13-ts2.6-oss-latest"` |  |
| nodeSelector | object | `{}` |  |
| patroniAdminPassword.key | string | `"timescaledbAdminPassword"` |  |
| patroniAdminPassword.name | string | `"harness-secrets"` |  |
| patroniPostgresPassword.key | string | `"timescaledbPostgresPassword"` |  |
| patroniPostgresPassword.name | string | `"harness-secrets"` |  |
| patroniReplicationPassword.key | string | `"timescaledbStandbyPassword"` |  |
| patroniReplicationPassword.name | string | `"harness-secrets"` |  |
| patroniStandbyPassword.key | string | `"timescaledbStandbyPassword"` |  |
| patroniStandbyPassword.name | string | `"harness-secrets"` |  |
| patroniSuperuserPassword.key | string | `"timescaledbPostgresPassword"` |  |
| patroniSuperuserPassword.name | string | `"harness-secrets"` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | int | `1` |  |
| resources.limits.memory | string | `"2048Mi"` |  |
| resources.requests.cpu | int | `1` |  |
| resources.requests.memory | string | `"2048Mi"` |  |
| storage.capacity | string | `"100Gi"` |  |
| tolerations | list | `[]` |  |

