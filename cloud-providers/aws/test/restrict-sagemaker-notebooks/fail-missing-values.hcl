module "tfplan-functions" {
  source = "../../../../modules/tfplan-functions/tfplan-functions.sentinel"
}

module "general-functions" {
  source = "../../../../modules/general-functions/general-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-fail-missing-values.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
