module "tfstate-functions" {
  source = "../../../../modules/tfstate-functions/tfstate-functions.sentinel"
}

module "general-functions" {
  source = "../../../../modules/general-functions/general-functions.sentinel"
}

mock "tfstate/v2" {
  module {
    source = "mock-tfstate-pass-prod.sentinel"
  }
}

mock "tfrun" {
  module {
    source = "mock-tfrun-pass-prod.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
