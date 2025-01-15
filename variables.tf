variable "mssql_databases" {
  description = "List of MSSQL databases to deploy"
  type = list(object({
    name                                                       = string
    server_id                                                  = string
    auto_pause_delay_in_minutes                                = optional(number)
    create_mode                                                = optional(string, "Default")
    creation_source_database_id                                = optional(string)
    collation                                                  = optional(string, "SQL_Latin1_General_CP1_CI_AS")
    elastic_pool_id                                            = optional(string)
    enclave_type                                               = optional(string)
    geo_backup_enabled                                         = optional(bool, false)
    maintenance_configuration_mode                             = optional(string)
    ledger_enabled                                             = optional(bool, false)
    license_type                                               = optional(string)
    max_size_gb                                                = optional(string)
    min_capacity                                               = optional(string)
    restore_point_in_time                                      = optional(string)
    recover_database_id                                        = optional(string)
    recovery_point_id                                          = optional(string)
    restore_dropped_database_id                                = optional(string)
    restore_long_term_retention_backup_id                      = optional(string)
    read_replica_count                                         = optional(number)
    read_scale                                                 = optional(string)
    sample_name                                                = optional(string)
    sku_name                                                   = optional(string)
    storage_account_type                                       = optional(string)
    identity_type                                              = optional(string)
    identity_ids                                               = optional(list(string))
    transparent_data_encryption_enabled                        = optional(bool, true)
    transparent_data_encryption_key_vault_key_id               = optional(string)
    transparent_data_encryption_key_automatic_rotation_enabled = optional(bool, false)
    zone_redundant                                             = optional(bool, false)
    secondary_type                                             = optional(string)

    threat_detection_policy = optional(object({
      state                      = optional(string, "Enabled")
      disabled_alerts            = optional(list(string))
      email_account_admins       = optional(string, "Disabled")
      email_addresses            = optional(list(string))
      retention_days             = optional(number, 0)
      storage_account_access_key = optional(string)
      storage_endpoint           = optional(string)
    }))

    short_term_retention_policy = optional(object({
      retention_days           = optional(string)
      backup_interval_in_hours = optional(string)
    }))

    long_term_retention_policy = optional(object({
      weekly_retention  = optional(string)
      monthly_retention = optional(string)
      yearly_retention  = optional(string)
      week_of_year      = optional(string)
    }))

    import = optional(object({
      storage_uri                  = string
      storage_key                  = string
      storage_key_type             = string
      administrator_login          = string
      administrator_login_password = string
      authentication_type          = string
      storage_account_id           = optional(string)
    }))
  }))
}
