```hcl
###############################################################################
# azurerm_mssql_database resource
###############################################################################
resource "azurerm_mssql_database" "this" {
  for_each = {
    for db in var.mssql_databases :
    db.name => db
  }

  name      = each.value.name
  server_id = each.value.server_id

  # Optional fields with defaults
  create_mode                  = try(each.value.create_mode, "Default")
  collation                    = try(each.value.collation, "SQL_Latin1_General_CP1_CI_AS")
  enclave_type                 = try(each.value.enclave_type, null)
  geo_backup_enabled           = try(each.value.geo_backup_enabled, false)
  ledger_enabled               = try(each.value.ledger_enabled, false)
  license_type                 = try(each.value.license_type, null)
  max_size_gb                  = try(each.value.max_size_gb, null)
  min_capacity                 = try(each.value.min_capacity, null)
  restore_point_in_time        = try(each.value.restore_point_in_time, null)
  recover_database_id          = try(each.value.recover_database_id, null)
  recovery_point_id            = try(each.value.recovery_point_id, null)
  restore_dropped_database_id  = try(each.value.restore_dropped_database_id, null)
  restore_long_term_retention_backup_id = try(each.value.restore_long_term_retention_backup_id, null)
  read_replica_count           = try(each.value.read_replica_count, null)
  read_scale                   = try(each.value.read_scale, null)
  sample_name                  = try(each.value.sample_name, null)
  sku_name                     = try(each.value.sku_name, null)
  storage_account_type         = try(each.value.storage_account_type, null)
  zone_redundant               = try(each.value.zone_redundant, false)
  secondary_type               = try(each.value.secondary_type, null)

  # auto_pause_delay_in_minutes (serverless)
  auto_pause_delay_in_minutes = try(each.value.auto_pause_delay_in_minutes, null)

  # Maintenance config
  maintenance_configuration_name = try(each.value.maintenance_configuration_mode, null)

  # Transparent data encryption
  transparent_data_encryption_enabled                        = try(each.value.transparent_data_encryption_enabled, true)
  transparent_data_encryption_key_vault_key_id               = try(each.value.transparent_data_encryption_key_vault_key_id, null)
  transparent_data_encryption_key_automatic_rotation_enabled = try(each.value.transparent_data_encryption_key_automatic_rotation_enabled, false)


  dynamic "identity" {
    for_each = each.value.identity_type == "SystemAssigned" ? [each.value.identity_type] : []
    content {
      type = each.value.identity_type
    }
  }

  dynamic "identity" {
    for_each = each.value.identity_type == "SystemAssigned, UserAssigned" ? [each.value.identity_type] : []
    content {
      type         = each.value.identity_type
      identity_ids = try(each.value.identity_ids, [])
    }
  }

  dynamic "identity" {
    for_each = each.value.identity_type == "UserAssigned" ? [each.value.identity_type] : []
    content {
      type         = each.value.identity_type
      identity_ids = length(try(each.value.identity_ids, [])) > 0 ? each.value.identity_ids : []
    }
  }

  # Elastic pool usage
  elastic_pool_id = try(each.value.elastic_pool_id, null)


  #############################################################################
  # Threat Detection Policy
  #############################################################################
  dynamic "threat_detection_policy" {
    for_each = each.value.threat_detection_policy != null ? [each.value.threat_detection_policy] : []
    content {
      state               = try(threat_detection_policy.value.state, "Enabled")
      disabled_alerts     = try(threat_detection_policy.value.disabled_alerts, [])
      email_account_admins = try(threat_detection_policy.value.email_account_admins, "Disabled")
      email_addresses     = try(threat_detection_policy.value.email_addresses, [])
      retention_days      = try(threat_detection_policy.value.retention_days, 0)
      storage_endpoint    = try(threat_detection_policy.value.storage_endpoint, null)
      storage_account_access_key = try(threat_detection_policy.value.storage_account_access_key, null)
    }
  }

  #############################################################################
  # Short-Term Retention Policy
  #############################################################################
  dynamic "short_term_retention_policy" {
    for_each = each.value.short_term_retention_policy != null
      ? [each.value.short_term_retention_policy]
      : []
    content {
      retention_days           = try(short_term_retention_policy.value.retention_days, null)
      backup_interval_in_hours = try(short_term_retention_policy.value.backup_interval_in_hours, null)
    }
  }

  #############################################################################
  # Long-Term Retention Policy
  #############################################################################
  dynamic "long_term_retention_policy" {
    for_each = each.value.long_term_retention_policy != null
      ? [each.value.long_term_retention_policy]
      : []
    content {
      weekly_retention  = try(long_term_retention_policy.value.weekly_retention, null)
      monthly_retention = try(long_term_retention_policy.value.monthly_retention, null)
      yearly_retention  = try(long_term_retention_policy.value.yearly_retention, null)
      week_of_year      = try(long_term_retention_policy.value.week_of_year, null)
    }
  }

  #############################################################################
  # Import
  #
  # azurerm_mssql_database resource supports inline import for
  # data-tier application (bacpac) using these fields.
  #############################################################################
  dynamic "import" {
    for_each = each.value.import != null ? [each.value.import] : []
    content {
      storage_uri                  = import.value.storage_uri
      storage_key                  = import.value.storage_key
      storage_key_type             = import.value.storage_key_type
      administrator_login          = import.value.administrator_login
      administrator_login_password = import.value.administrator_login_password
      authentication_type          = import.value.authentication_type
      storage_account_id           = try(import.value.storage_account_id, null)
    }
  }
}
```
