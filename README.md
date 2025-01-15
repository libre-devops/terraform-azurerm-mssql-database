```hcl
#
```
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mssql_databases"></a> [mssql\_databases](#input\_mssql\_databases) | List of MSSQL databases to deploy | <pre>list(object({<br/>    name                                                       = string<br/>    server_id                                                  = string<br/>    auto_pause_delay_in_minutes                                = optional(number)<br/>    create_mode                                                = optional(string, "Default")<br/>    creation_source_database_id                                = optional(string)<br/>    collation                                                  = optional(string, "SQL_Latin1_General_CP1_CI_AS")<br/>    elastic_pool_id                                            = optional(string)<br/>    enclave_type                                               = optional(string)<br/>    geo_backup_enabled                                         = optional(bool, false)<br/>    maintenance_configuration_mode                             = optional(string)<br/>    ledger_enabled                                             = optional(bool, false)<br/>    license_type                                               = optional(string)<br/>    max_size_gb                                                = optional(string)<br/>    min_capacity                                               = optional(string)<br/>    restore_point_in_time                                      = optional(string)<br/>    recover_database_id                                        = optional(string)<br/>    recovery_point_id                                          = optional(string)<br/>    restore_dropped_database_id                                = optional(string)<br/>    restore_long_term_retention_backup_id                      = optional(string)<br/>    read_replica_count                                         = optional(number)<br/>    read_scale                                                 = optional(string)<br/>    sample_name                                                = optional(string)<br/>    sku_name                                                   = optional(string)<br/>    storage_account_type                                       = optional(string)<br/>    identity_type                                              = optional(string)<br/>    identity_ids                                               = optional(list(string))<br/>    transparent_data_encryption_enabled                        = optional(bool, true)<br/>    transparent_data_encryption_key_vault_key_id               = optional(string)<br/>    transparent_data_encryption_key_automatic_rotation_enabled = optional(bool, false)<br/>    zone_redundant                                             = optional(bool, false)<br/>    secondary_type                                             = optional(string)<br/><br/>    threat_detection_policy = optional(object({<br/>      state                      = optional(string, "Enabled")<br/>      disabled_alerts            = optional(list(string))<br/>      email_account_admins       = optional(string, "Disabled")<br/>      email_addresses            = optional(list(string))<br/>      retention_days             = optional(number, 0)<br/>      storage_account_access_key = optional(string)<br/>      storage_endpoint           = optional(string)<br/>    }))<br/><br/>    short_term_retention_policy = optional(object({<br/>      retention_days           = optional(string)<br/>      backup_interval_in_hours = optional(string)<br/>    }))<br/><br/>    long_term_retention_policy = optional(object({<br/>      weekly_retention  = optional(string)<br/>      monthly_retention = optional(string)<br/>      yearly_retention  = optional(string)<br/>      week_of_year      = optional(string)<br/>    }))<br/><br/>    import = optional(object({<br/>      storage_uri                  = string<br/>      storage_key                  = string<br/>      storage_key_type             = string<br/>      administrator_login          = string<br/>      administrator_login_password = string<br/>      authentication_type          = string<br/>      storage_account_id           = optional(string)<br/>    }))<br/>  }))</pre> | n/a | yes |

## Outputs

No outputs.
