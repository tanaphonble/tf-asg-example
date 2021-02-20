output "address" {
  value       = module.data_sources.address
  description = "Connect to the database at this endpoint"
}

output "port" {
  value       = module.data_sources.port
  description = "The port the database is listening on"
}
