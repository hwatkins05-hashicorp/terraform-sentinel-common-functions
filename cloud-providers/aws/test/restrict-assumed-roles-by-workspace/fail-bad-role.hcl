module "aws-functions" {
  source = "../../aws-functions/aws-functions.sentinel"
}

module "tfconfig-functions" {
  source = "../../../../modules/tfconfig-functions/tfconfig-functions.sentinel"
}

module "general-functions" {
  source = "../../../../modules/general-functions/general-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-fail-bad-role.sentinel"
  }
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-fail-bad-role.sentinel"
  }
}


mock "tfrun" {
  module {
    source = "mock-tfrun-dev.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
