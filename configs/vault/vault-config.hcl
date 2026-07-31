ui = true

storage "file" {
  path = "/vault/file"
}

listener "tcp" {
  address       = "0.0.0.0:8300"
  tls_disable = true
}

api_addr     = "http://vault.imetric.arpa"
# cluster_addr = "https://vault.imetric.arpa:8201"
