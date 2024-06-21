module "tfplan-functions" {
  source = "../../../../modules/tfplan-functions/tfplan-functions.sentinel"
}

module "tfconfig-functions" {
  source = "../../../../modules/tfconfig-functions/tfconfig-functions.sentinel"
}

module "general-functions" {
  source = "../../../../modules/general-functions/general-functions.sentinel"
}

module "evaluating-functions" {
  source = "../../../../modules/evaluating-functions/evaluating-functions.sentinel"
}

module "filtering-functions" {
  source = "../../../../modules/filtering-functions/filtering-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-fail-invalid-vpces.sentinel"
  }
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-fail-invalid-vpces.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
