resource "google_project_iam_custom_role" "role" {
  count = var.module_enabled ? 1 : 0

  depends_on = [var.module_depends_on]

  role_id     = var.role_id
  title       = var.title
  description = var.description
  permissions = var.permissions
  stage       = var.stage
}
