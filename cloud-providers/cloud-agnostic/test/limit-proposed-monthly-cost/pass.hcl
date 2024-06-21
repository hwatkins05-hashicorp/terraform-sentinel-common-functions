module "tfrun-functions" {
  source = "../../../../modules/tfrun-functions/tfrun-functions.sentinel"
}

mock "tfrun" {
  module {
    source = "mock-tfrun-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
