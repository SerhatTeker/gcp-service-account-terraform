# ===================================================================
# Service account detail
# ===================================================================

output "email" {
  value       = google_service_account.sa.email
  description = "The e-mail address of the service account."
}

output "name" {
  value       = google_service_account.sa.name
  description = "The fully-qualified name of the service account."
}

output "account_id" {
  value       = google_service_account.sa.account_id
  description = "The unique id of the service account."
}

# ===================================================================
# Private key and decoded private key
# ===================================================================

output "private_key" {
  value     = google_service_account_key.sa_key.private_key
  sensitive = true
}

output "decoded_private_key" {
  value     = base64decode(google_service_account_key.sa_key.private_key)
  sensitive = true
}
