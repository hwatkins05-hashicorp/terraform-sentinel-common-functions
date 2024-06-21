module "general-functions" {
  source = "../../../../modules/general-functions/general-functions.sentinel"
}

module "azure-functions" {
  source = "../../azure-functions/azure-functions.sentinel"
}

module "tfplan-functions" {
  source = "../../../../modules/tfplan-functions/tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
