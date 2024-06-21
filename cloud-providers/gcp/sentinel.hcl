module "tfplan-functions" {
    source = "../../modules/tfplan-functions/tfplan-functions.sentinel"
}

module "tfstate-functions" {
    source = "../../modules/tfstate-functions/tfstate-functions.sentinel"
}

module "tfconfig-functions" {
    source = "../../modules/tfconfig-functions/tfconfig-functions.sentinel"
}

module "general-functions" {
    source = "../../modules/general-functions/general-functions.sentinel"
}

module "evaluating-functions" {
    source = "../../modules/evaluating-functions/evaluating-functions.sentinel"
}

module "filtering-functions" {
    source = "../../modules/filtering-functions/filtering-functions.sentinel"
}

module "gcp-functions" {
    source = "./gcp-functions/gcp-functions.sentinel"
}

policy "enforce-mandatory-labels" {
    source = "./enforce-mandatory-labels.sentinel"
    enforcement_level = "advisory"
}

policy "restrict-egress-firewall-destination-ranges" {
    source = "./restrict-egress-firewall-destination-ranges.sentinel"
    enforcement_level = "advisory"
}

policy "restrict-gce-machine-type" {
    source = "./restrict-gce-machine-type.sentinel"
    enforcement_level = "advisory"
}

policy "restrict-gke-clusters" {
    source = "./restrict-gke-clusters.sentinel"
    enforcement_level = "advisory"
}

policy "restrict-ingress-firewall-source-ranges" {
    source = "./restrict-ingress-firewall-source-ranges.sentinel"
    enforcement_level = "advisory"
}
