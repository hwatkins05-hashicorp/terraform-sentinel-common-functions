module "tfstate-functions" {
  source = "../../../../modules/tfstate-functions/tfstate-functions.sentinel"
}

module "general-functions" {
  source = "../../../../modules/general-functions/general-functions.sentinel"
}

mock "tfstate/v2" {
  module {
    source = "mock-tfstate-fail-qa.sentinel"
  }
}

mock "tfrun" {
  module {
    source = "mock-tfrun-fail-qa.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
