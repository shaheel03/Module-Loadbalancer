rg = {
  rg1 = {
    name     = "lb-rg"
    location = "west europe"
  }
}

#  Create Network Security Group

nsg = {
  nsg1 = {
    name = "lb-nsg"
  }

}
security_rules = {
  rules1 = {
    name              = "test1"
    priority          = 100
    source_port_range = "22"
  }
  rules2 = {
    name              = "test2"
    priority          = 101
    source_port_range = "80"
  }
}

vnet = {
  vnet1 = {
    name = "lb-vnet"
  }
}

subnet = {
  subnet1 = {
    name             = "lb-subnet1"
    address_prefixes = "10.0.1.0/24"
  }
  subnet2 = {
    name             = "lb-subnet2"
    address_prefixes = "10.0.2.0/24"
  }

  subnet3 = {
    name             = "AzureBastionSubnet"
    address_prefixes = "10.0.3.0/24"
  }
}

pip = {
  pip1 = {
    name = "lb-pip1"
  }

  pip2 = {
    name = "bastion-pip"
  }
}

nic = {
  nic1 = {
    name  = "lb-nic1"
    sname = "lb-subnet1"
    #pipname = "lb-pip1"


    ip_configuration = {
      name = "configtest1"

    }
  }
  nic2 = {
    name  = "lb-nic2"
    sname = "lb-subnet2"
    #pipname = "lb-pip2"


    ip_configuration = {
      name = "configtest2"

    }
  }
}



vm = {
  vm1 = {
    name    = "lb-vm1"
    user="adminuser"
    nicname = "lb-nic1"
  }
  vm2 = {
    name    = "lb-vm2"
    user="adminuser"
    nicname = "lb-nic2"
  }
}

my_lb = "my_loadbalancer"
blb = "my_backendpool"
blip = {
  blip1={
    name="backend_pool_vm1"
    vm="lb-vm1"
  }
  blip2={
    name="backend_pool_vm2"
    vm="lb-vm2"
  }
}


kv = "hclaccesskey"

key_secret = {
  rule1 = {
    name  = "username"
    value = "shaktimaankimaa"
  }
  rule2 = {
    name  = "password"
    value = "Shaktimaan@123456"
  }

}

bastion-host = "bastion_host"