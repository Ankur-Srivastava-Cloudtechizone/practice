module "resource_group" {
  source = "../../module/rg"
  rg_map = var.rg_map
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../module/vnet"
  vnet_map   = var.vnet_map
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../module/subnet"
  subnet_map = var.subnet_map
}

module "network_security_group" {
  depends_on = [module.subnet, module.resource_group]
  source     = "../../module/nsg"
  nsg_map    = var.nsg_map
}