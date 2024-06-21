param "organization" {
  value = "Cloud-Operations"
}

param "token" {
  value = ""
}

module "general-functions" {
    source = "../../../../modules/general-functions/general-functions.sentinel"
}

module "tfconfig-functions" {
      source = "../../../../../modules/tfconfig-functions/tfconfig-functions.sentinel"
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-fail-invalid-version-constraint.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
