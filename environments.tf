resource "azuredevops_environment" "main" {
  count = length(var.environments)
  project_id = azuredevops_project.main.id
  name = var.environments[count.index]
}