param "public_registry" {
  value = true
}

param "address" {
  value = "registry.terraform.io"
}

param "limit" {
  value = 100
}

param "organization" {
  value = "Azure"
}

param "token" {
  value = ""
}

module "general-functions" {
    source = "../../../../modules/general-functions/general-functions.sentinel"
}

module "tfconfig-functions" {
      source = "../../../modules/tfconfig-functions/tfconfig-functions.sentinel"
}

mock "tfconfig/v2" {
  module {
    source = "mocks/mock-tfconfig-fail.sentinel"
  }
}
