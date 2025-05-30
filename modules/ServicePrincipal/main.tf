resource "azuread_application" "main" {
  display_name = var.service_principal_name
}
  

resource "azuread_service_principal" "main" {
  app_role_assignment_required = true
  client_id = azuread_application.main.client_id
}

resource "azuread_service_principal_password" "main" {
  service_principal_id = azuread_service_principal.main.id
}