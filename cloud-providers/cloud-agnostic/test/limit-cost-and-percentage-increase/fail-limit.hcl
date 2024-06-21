module "tfrun-functions" {
  source = "../../../../modules/tfrun-functions/tfrun-functions.sentinel"
}

mock "tfrun" {
  module {
    source = "mock-tfrun-fail-limit.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
