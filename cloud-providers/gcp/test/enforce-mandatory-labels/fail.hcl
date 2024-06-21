module "tfplan-functions" {
  source = "../../../../modules/tfplan-functions/tfplan-functions.sentinel"
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

module "gcp-functions" {
  source = "../../gcp-functions/gcp-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-fail.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
