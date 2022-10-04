# timescaledb

![Version: 0.2.12](https://img.shields.io/badge/Version-0.2.12-informational?style=flat-square)

TimescaleDB HA Deployment.

**Homepage:** <https://github.com/hanress/helm-timescale>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://harness.github.io/helm-common | harness-common | 1.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| affinityTemplate | string | `"podAntiAffinity:\n  preferredDuringSchedulingIgnoredDuringExecution:\n  - weight: 100\n    podAffinityTerm:\n      topologyKey: \"kubernetes.io/hostname\"\n      labelSelector:\n        matchLabels:\n          app: {{ template \"timescaledb.fullname\" . }}\n          release: {{ .Release.Name | quote }}\n          cluster-name: {{ template \"clusterName\" . }}\n  - weight: 50\n    podAffinityTerm:\n      topologyKey: failure-domain.beta.kubernetes.io/zone\n      labelSelector:\n        matchLabels:\n          app: {{ template \"timescaledb.fullname\" . }}\n          release: {{ .Release.Name | quote }}\n          cluster-name: {{ template \"clusterName\" . }}\n"` |  |
| backup.enabled | bool | `false` |  |
| backup.env | string | `nil` |  |
| backup.envFrom | string | `nil` |  |
| backup.jobs[0].name | string | `"full-weekly"` |  |
| backup.jobs[0].schedule | string | `"12 02 * * 0"` |  |
| backup.jobs[0].type | string | `"full"` |  |
| backup.jobs[1].name | string | `"incremental-daily"` |  |
| backup.jobs[1].schedule | string | `"12 02 * * 1-6"` |  |
| backup.jobs[1].type | string | `"incr"` |  |
| backup.pgBackRest.compress-type | string | `"lz4"` |  |
| backup.pgBackRest.process-max | int | `4` |  |
| backup.pgBackRest.repo1-cipher-type | string | `"none"` |  |
| backup.pgBackRest.repo1-retention-diff | int | `2` |  |
| backup.pgBackRest.repo1-retention-full | int | `2` |  |
| backup.pgBackRest.repo1-s3-endpoint | string | `"s3.amazonaws.com"` |  |
| backup.pgBackRest.repo1-s3-region | string | `"us-east-2"` |  |
| backup.pgBackRest.repo1-type | string | `"s3"` |  |
| backup.pgBackRest.start-fast | string | `"y"` |  |
| backup.pgBackRest:archive-get | object | `{}` |  |
| backup.pgBackRest:archive-push | object | `{}` |  |
| bootstrapFromBackup.enabled | bool | `false` |  |
| bootstrapFromBackup.repo1-path | string | `nil` |  |
| bootstrapFromBackup.secretName | string | `"pgbackrest-bootstrap"` |  |
| callbacks.configMap | string | `nil` |  |
| clusterName | string | `"timescaledb-single-chart"` |  |
| curlImage.digest | string | `""` |  |
| curlImage.pullPolicy | string | `"Always"` |  |
| curlImage.registry | string | `"docker.io"` |  |
| curlImage.repository | string | `"curlimages/curl"` |  |
| curlImage.tag | string | `"latest"` |  |
| debug.execStartPre | string | `nil` |  |
| env | string | `nil` |  |
| envFrom | string | `nil` |  |
| fullWalPrevention.checkFrequency | int | `30` |  |
| fullWalPrevention.enabled | bool | `false` |  |
| fullWalPrevention.thresholds.readOnlyFreeMB | int | `64` |  |
| fullWalPrevention.thresholds.readOnlyFreePercent | int | `5` |  |
| fullWalPrevention.thresholds.readWriteFreeMB | int | `128` |  |
| fullWalPrevention.thresholds.readWriteFreePercent | int | `8` |  |
| image.digest | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"timescale/timescaledb-ha"` |  |
| image.tag | string | `"pg13-ts2.6-oss-latest"` |  |
| loadBalancer.annotations."service.beta.kubernetes.io/aws-load-balancer-connection-idle-timeout" | string | `"4000"` |  |
| loadBalancer.enabled | bool | `false` |  |
| loadBalancer.port | int | `5432` |  |
| loadBalancer.spec | string | `nil` |  |
| nameOverride | string | `"timescaledb"` |  |
| networkPolicy.enabled | bool | `false` |  |
| networkPolicy.ingress | string | `nil` |  |
| networkPolicy.prometheusApp | string | `"prometheus"` |  |
| nodeSelector | object | `{}` |  |
| patroni.bootstrap.dcs.loop_wait | int | `10` |  |
| patroni.bootstrap.dcs.maximum_lag_on_failover | int | `33554432` |  |
| patroni.bootstrap.dcs.postgresql.parameters."timescaledb.passfile" | string | `"../.pgpass"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.archive_command | string | `"/etc/timescaledb/scripts/pgbackrest_archive.sh %p"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.archive_mode | string | `"on"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.archive_timeout | string | `"1800s"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.autovacuum_analyze_scale_factor | float | `0.02` |  |
| patroni.bootstrap.dcs.postgresql.parameters.autovacuum_max_workers | int | `10` |  |
| patroni.bootstrap.dcs.postgresql.parameters.autovacuum_naptime | string | `"5s"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.autovacuum_vacuum_cost_limit | int | `500` |  |
| patroni.bootstrap.dcs.postgresql.parameters.autovacuum_vacuum_scale_factor | float | `0.05` |  |
| patroni.bootstrap.dcs.postgresql.parameters.hot_standby | string | `"on"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.log_autovacuum_min_duration | string | `"1min"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.log_checkpoints | string | `"on"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.log_connections | string | `"on"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.log_disconnections | string | `"on"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.log_line_prefix | string | `"%t [%p]: [%c-%l] %u@%d,app=%a [%e] "` |  |
| patroni.bootstrap.dcs.postgresql.parameters.log_lock_waits | string | `"on"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.log_min_duration_statement | string | `"1s"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.log_statement | string | `"ddl"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.max_connections | int | `100` |  |
| patroni.bootstrap.dcs.postgresql.parameters.max_prepared_transactions | int | `150` |  |
| patroni.bootstrap.dcs.postgresql.parameters.shared_preload_libraries | string | `"timescaledb,pg_stat_statements"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.tcp_keepalives_idle | int | `900` |  |
| patroni.bootstrap.dcs.postgresql.parameters.tcp_keepalives_interval | int | `100` |  |
| patroni.bootstrap.dcs.postgresql.parameters.temp_file_limit | string | `"1GB"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.unix_socket_directories | string | `"/var/run/postgresql"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.unix_socket_permissions | string | `"0750"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.wal_level | string | `"hot_standby"` |  |
| patroni.bootstrap.dcs.postgresql.parameters.wal_log_hints | string | `"on"` |  |
| patroni.bootstrap.dcs.postgresql.use_pg_rewind | bool | `true` |  |
| patroni.bootstrap.dcs.postgresql.use_slots | bool | `true` |  |
| patroni.bootstrap.dcs.retry_timeout | int | `10` |  |
| patroni.bootstrap.dcs.ttl | int | `30` |  |
| patroni.bootstrap.method | string | `"restore_or_initdb"` |  |
| patroni.bootstrap.post_init | string | `"/etc/timescaledb/scripts/post_init.sh"` |  |
| patroni.bootstrap.restore_or_initdb.command | string | `"/etc/timescaledb/scripts/restore_or_initdb.sh --encoding=UTF8 --locale=C.UTF-8\n"` |  |
| patroni.bootstrap.restore_or_initdb.keep_existing_recovery_conf | bool | `true` |  |
| patroni.kubernetes.role_label | string | `"role"` |  |
| patroni.kubernetes.scope_label | string | `"cluster-name"` |  |
| patroni.kubernetes.use_endpoints | bool | `true` |  |
| patroni.log.level | string | `"WARNING"` |  |
| patroni.postgresql.authentication.replication.username | string | `"standby"` |  |
| patroni.postgresql.authentication.superuser.username | string | `"postgres"` |  |
| patroni.postgresql.basebackup[0].waldir | string | `"/var/lib/postgresql/wal/pg_wal"` |  |
| patroni.postgresql.callbacks.on_reload | string | `"/etc/timescaledb/scripts/patroni_callback.sh"` |  |
| patroni.postgresql.callbacks.on_restart | string | `"/etc/timescaledb/scripts/patroni_callback.sh"` |  |
| patroni.postgresql.callbacks.on_role_change | string | `"/etc/timescaledb/scripts/patroni_callback.sh"` |  |
| patroni.postgresql.callbacks.on_start | string | `"/etc/timescaledb/scripts/patroni_callback.sh"` |  |
| patroni.postgresql.callbacks.on_stop | string | `"/etc/timescaledb/scripts/patroni_callback.sh"` |  |
| patroni.postgresql.create_replica_methods[0] | string | `"pgbackrest"` |  |
| patroni.postgresql.create_replica_methods[1] | string | `"basebackup"` |  |
| patroni.postgresql.listen | string | `"0.0.0.0:5432"` |  |
| patroni.postgresql.pg_hba[0] | string | `"local     all             postgres                              peer"` |  |
| patroni.postgresql.pg_hba[1] | string | `"local     all             all                                   md5"` |  |
| patroni.postgresql.pg_hba[2] | string | `"hostnossl all,replication all                all                reject"` |  |
| patroni.postgresql.pg_hba[3] | string | `"hostssl   all             all                127.0.0.1/32       md5"` |  |
| patroni.postgresql.pg_hba[4] | string | `"hostssl   all             all                ::1/128            md5"` |  |
| patroni.postgresql.pg_hba[5] | string | `"hostssl   replication     standby            all                md5"` |  |
| patroni.postgresql.pg_hba[6] | string | `"hostssl   all             all                all                md5"` |  |
| patroni.postgresql.pgbackrest.command | string | `"/etc/timescaledb/scripts/pgbackrest_restore.sh"` |  |
| patroni.postgresql.pgbackrest.keep_data | bool | `true` |  |
| patroni.postgresql.pgbackrest.no_master | bool | `true` |  |
| patroni.postgresql.pgbackrest.no_params | bool | `true` |  |
| patroni.postgresql.recovery_conf.restore_command | string | `"/etc/timescaledb/scripts/pgbackrest_archive_get.sh %f \"%p\""` |  |
| patroni.postgresql.use_unix_socket | bool | `true` |  |
| patroni.restapi.listen | string | `"0.0.0.0:8008"` |  |
| persistentVolumes.data.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistentVolumes.data.annotations | object | `{}` |  |
| persistentVolumes.data.enabled | bool | `true` |  |
| persistentVolumes.data.mountPath | string | `"/var/lib/postgresql"` |  |
| persistentVolumes.data.size | string | `"100Gi"` |  |
| persistentVolumes.data.subPath | string | `""` |  |
| persistentVolumes.wal.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistentVolumes.wal.annotations | object | `{}` |  |
| persistentVolumes.wal.enabled | bool | `true` |  |
| persistentVolumes.wal.mountPath | string | `"/var/lib/postgresql/wal"` |  |
| persistentVolumes.wal.size | string | `"1Gi"` |  |
| persistentVolumes.wal.storageClass | string | `nil` |  |
| persistentVolumes.wal.subPath | string | `""` |  |
| pgBouncer.config.default_pool_size | int | `12` |  |
| pgBouncer.config.max_client_conn | int | `500` |  |
| pgBouncer.config.pool_mode | string | `"transaction"` |  |
| pgBouncer.config.server_reset_query | string | `"DISCARD ALL"` |  |
| pgBouncer.enabled | bool | `false` |  |
| pgBouncer.pg_hba[0] | string | `"local     all postgres                   peer"` |  |
| pgBouncer.pg_hba[1] | string | `"host      all postgres,standby 0.0.0.0/0 reject"` |  |
| pgBouncer.pg_hba[2] | string | `"host      all postgres,standby ::0/0     reject"` |  |
| pgBouncer.pg_hba[3] | string | `"hostssl   all all              0.0.0.0/0 md5"` |  |
| pgBouncer.pg_hba[4] | string | `"hostssl   all all              ::0/0     md5"` |  |
| pgBouncer.pg_hba[5] | string | `"hostnossl all all              0.0.0.0/0 reject"` |  |
| pgBouncer.pg_hba[6] | string | `"hostnossl all all              ::0/0     reject"` |  |
| pgBouncer.port | int | `6432` |  |
| pgBouncer.userListSecretName | string | `nil` |  |
| podAnnotations | object | `{}` |  |
| podManagementPolicy | string | `"OrderedReady"` |  |
| postInit[0].configMap.name | string | `"timescale-harness-post-init"` |  |
| postInit[0].configMap.optional | bool | `false` |  |
| postInit[1].secret.name | string | `"custom-secret-scripts"` |  |
| postInit[1].secret.optional | bool | `true` |  |
| prometheus.enabled | bool | `false` |  |
| prometheus.env | string | `nil` |  |
| prometheus.image.pullPolicy | string | `"Always"` |  |
| prometheus.image.repository | string | `"quay.io/prometheuscommunity/postgres-exporter"` |  |
| prometheus.image.tag | string | `"v0.11.0"` |  |
| prometheus.volumeMounts | string | `nil` |  |
| prometheus.volumes | string | `nil` |  |
| rbac.create | bool | `true` |  |
| readinessProbe.enabled | bool | `true` |  |
| readinessProbe.failureThreshold | int | `6` |  |
| readinessProbe.initialDelaySeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `30` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| replicaCount | int | `3` |  |
| replicaLoadBalancer.annotations."service.beta.kubernetes.io/aws-load-balancer-connection-idle-timeout" | string | `"4000"` |  |
| replicaLoadBalancer.enabled | bool | `false` |  |
| replicaLoadBalancer.port | int | `5432` |  |
| replicaLoadBalancer.spec | string | `nil` |  |
| resources | object | `{}` |  |
| secrets.certificate."tls.crt" | string | `""` |  |
| secrets.certificate."tls.key" | string | `""` |  |
| secrets.certificateSecretName | string | `""` |  |
| secrets.credentials.PATRONI_REPLICATION_PASSWORD | string | `""` |  |
| secrets.credentials.PATRONI_SUPERUSER_PASSWORD | string | `""` |  |
| secrets.credentials.PATRONI_admin_PASSWORD | string | `""` |  |
| secrets.credentialsSecretName | string | `"harness-secrets"` |  |
| secrets.pgbackrest.PGBACKREST_REPO1_S3_BUCKET | string | `""` |  |
| secrets.pgbackrest.PGBACKREST_REPO1_S3_ENDPOINT | string | `"s3.amazonaws.com"` |  |
| secrets.pgbackrest.PGBACKREST_REPO1_S3_KEY | string | `""` |  |
| secrets.pgbackrest.PGBACKREST_REPO1_S3_KEY_SECRET | string | `""` |  |
| secrets.pgbackrest.PGBACKREST_REPO1_S3_REGION | string | `""` |  |
| secrets.pgbackrestSecretName | string | `""` |  |
| secrets.useCertificates | bool | `false` |  |
| service.primary.annotations | object | `{}` |  |
| service.primary.labels | object | `{}` |  |
| service.primary.nodePort | string | `nil` |  |
| service.primary.port | int | `5432` |  |
| service.primary.spec | object | `{}` |  |
| service.primary.type | string | `"ClusterIP"` |  |
| service.replica.annotations | object | `{}` |  |
| service.replica.labels | object | `{}` |  |
| service.replica.nodePort | string | `nil` |  |
| service.replica.port | int | `5432` |  |
| service.replica.spec | object | `{}` |  |
| service.replica.type | string | `"ClusterIP"` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `nil` |  |
| serviceMonitor.enabled | bool | `false` |  |
| serviceMonitor.interval | string | `"10s"` |  |
| serviceMonitor.path | string | `"/metrics"` |  |
| serviceMonitor.portName | string | `"metrics"` |  |
| sharedMemory.useMount | bool | `false` |  |
| timescaledbTune.args | object | `{}` |  |
| timescaledbTune.enabled | bool | `true` |  |
| tolerations | list | `[]` |  |
| version | string | `nil` |  |

