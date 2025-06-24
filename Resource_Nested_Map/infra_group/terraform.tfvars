rg_names = {
  "rg1" = {
    name = "rg-ram"
    location = "japan east"
    }
  "rg2" = {
    name = "rg-shyam"
    location = "central india"
  }
  "rg3" = { 
    name = "rg-jadu" 
    location = "east us"
    }
  "rg4" = {
    name = "rg-madhu"
  location ="west Europe"
  }
}


stg_names = {
    "sa1" = {
        name = "stgkol"
        location = "east us"
        resource_group_name = "rg-ram"
        account_tier = "Standard"
        account_replication_type = "LRS"
    }

    "sa2" = {
        name = "stgkol"
        location = "east us"
        resource_group_name = "rg-ram"
        account_tier = "Standard"
        account_replication_type = "GRS"
    }
}