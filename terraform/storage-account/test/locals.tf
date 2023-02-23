locals {
  tags = {
    Project = "Azure/azure-data-labs-modules"
    Module  = "storage-account"
    Toolkit = "Terraform"
  }

  dns_st_blob   = "privatelink.blob.core.windows.net"
  dns_st_file   = "privatelink.file.core.windows.net"
  dns_st_dfs    = "privatelink.dfs.core.windows.net"

  p_ip_endpoint = "https://ifconfig.me"
  imds_endpoint = "http://169.254.169.254/metadata/instance/network/interface?api-version=2021-02-01&format=json&Metadata=true"
  imds_metadata = jsondecode(data.http.metadata.body)
}