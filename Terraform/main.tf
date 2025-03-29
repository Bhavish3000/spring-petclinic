module "AKS_SPC" {
  source = "git::https://github.com/Bhavish3000/AKS_Module.git//AKS_Module"
  resource_group = {
    name       = "aks"
    location   = "east us"
    managed_by = "Bhavish"
  }

  kubernetes_cluster = {
    name           = "AKS_cluster"
    dns_prefix     = "AKS"
    node_pool_name = "default"
    node_count     = 2
    vm_size        = "Standard_D4s_v3"
    identity_type  = "SystemAssigned"
  }
}