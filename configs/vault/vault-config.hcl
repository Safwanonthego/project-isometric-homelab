ui = true

storage "file" {
  path = "/vault/file"
}

listener "tcp" {
  address       = "0.0.0.0:8300"
  tls_disable = true
}

api_addr     = "https://vault.home.arpa"
# cluster_addr = "https://vault.home.arpa:8201"
