output "mssql_database_collations" {
  description = "A map of MSSQL Database collations, keyed by database name."
  value = {
    for db in azurerm_mssql_database.this :
    db.name => db.collation
  }
}

output "mssql_database_ids" {
  description = "A map of MSSQL Database IDs, keyed by database name."
  value = {
    for db in azurerm_mssql_database.this :
    db.name => db.id
  }
}

output "mssql_database_names" {
  description = "A map of MSSQL Database resource names, keyed by database name."
  value = {
    for db in azurerm_mssql_database.this :
    db.name => db.name
  }
}

output "mssql_database_server_ids" {
  description = "A map of the server_id on which each database is hosted, keyed by database name."
  value = {
    for db in azurerm_mssql_database.this :
    db.name => db.server_id
  }
}

output "mssql_database_sku_names" {
  description = "A map of MSSQL Database sku_names, keyed by database name."
  value = {
    for db in azurerm_mssql_database.this :
    db.name => db.sku_name
  }
}
