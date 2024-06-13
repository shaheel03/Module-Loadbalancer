module "mod-rg" {
  source = "../1.Resource_Group"
  rg     = var.rg

}

module "mod-nsg" {
  source     = "../2.Network_Security_Group"
  nsg        = var.nsg
  security   = var.security_rules
  depends_on = [module.mod-rg]
}

module "mod-vnet" {
  source     = "../3.Virtual_Network"
  vnet       = var.vnet
  depends_on = [module.mod-rg, module.mod-nsg]

}


module "mod-subnet" {
  source     = "../4.Subnet"
  subnet     = var.subnet
  depends_on = [module.mod-vnet]

}

module "mod-pip" {
  source     = "../5.Public_IP"
  pip        = var.pip
  depends_on = [module.mod-rg, module.mod-subnet]
}

module "mod-nic" {
  source     = "../6.Newtork_Interface"
  nic        = var.nic
  depends_on = [module.mod-pip]
}


module "mod-vm" {
  source     = "../7.Virtual_machine"
  vm         = var.vm
  depends_on = [module.mod-rg, module.mod-nic]
}



module "mod-lb" {
  source = "../8.LoadBalancer"
  my_lb=var.my_lb
  blb=var.blb
  blip=var.blip
  depends_on = [ module.mod-vm ]
}


module "mod-kv" {
  source = "../9.KeyVault"
  kv=var.kv
  key_secret = var.key_secret
  depends_on = [ module.mod-rg ]
}

module "mod-bastion" {
  source = "../10.Bastion"
  bastion-host=var.bastion-host
  depends_on = [ module.mod-subnet,module.mod-pip ]
}