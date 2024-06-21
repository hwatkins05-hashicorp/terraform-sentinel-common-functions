module "tfstate-functions" {
  source = "../../../../modules/tfstate-functions/tfstate-functions.sentinel"
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
