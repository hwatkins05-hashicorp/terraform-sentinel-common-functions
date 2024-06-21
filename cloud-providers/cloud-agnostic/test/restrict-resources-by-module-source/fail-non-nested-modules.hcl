module "general-functions" {
    source = "../../../../modules/general-functions/general-functions.sentinel"
}

module "tfconfig-functions" {
  source = "../../../../modules/tfconfig-functions/tfconfig-functions.sentinel"
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-fail-non-nested-modules.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
