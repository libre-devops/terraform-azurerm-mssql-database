data "azurerm_client_config" "current" {}

module "rg" {
  source = "registry.terraform.io/libre-devops/rg/azurerm"

  rg_name  = "rg-${var.short}-${var.loc}-${var.env}-${random_string.entropy.result}"
  location = local.location
  tags     = local.tags

  #  lock_level = "CanNotDelete" // Do not set this value to skip lock
}

module "mssql_servers" {
  source = "libre-devops/mssql-server/azurerm"

  mssql_servers = [
    {

      rg_name  = module.rg.rg_name
      location = module.rg.rg_location
      tags     = module.rg.rg_tags

      name          = "mssql-server-${var.short}-${var.loc}-${var.env}-01"
      identity_type = "SystemAssigned"

      azuread_administrator = {
        login_username              = "LibreDevOpsAdmin"
        tenant_id                   = data.azurerm_client_config.current.tenant_id
        object_id                   = data.azurerm_client_config.current.object_id
        azuread_authentication_only = true
      }
    }
  ]
}
