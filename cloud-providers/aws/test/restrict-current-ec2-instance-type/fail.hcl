module "tfstate-functions" {
  source = "../../../../modules/tfstate-functions/tfstate-functions.sentinel"
}

module "general-functions" {
  source = "../../../../modules/general-functions/general-functions.sentinel"
}

mock "tfstate/v2" {
  module {
    source = "mock-tfstate-fail.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
