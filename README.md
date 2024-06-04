# terraform-sentinel-common-functions

This library contains common, re-usable functions for creating Sentinel policies for Terraform. It also includes test cases and mocks which were created in 2020 for AWS, Microsoft Azure, Google Cloud Platform (GCP), and VMware.

Additionally, it contains [Policy Set](https://www.terraform.io/docs/cloud/sentinel/manage-policies.html#the-sentinel-hcl-configuration-file) configuration files so that the cloud-specific and cloud-agnostic policies can easily be added to Terraform Cloud organizations using [VCS Integrations](https://www.terraform.io/docs/cloud/vcs/index.html) after forking this repository.

These policies and the common functions they use can only be used with Terraform 0.13? and above, as well as __ version of Terraform Cloud and Enterprise (TFC, TFE) ___.

## Prerequisites
  * [Sentinel CLI](https://docs.hashicorp.com/sentinel/intro/getting-started/install)
  * [Terraform CLI (1.0+)](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Getting Started


## Common Functions
You can find most of the common functions used in the third-generation policies in the Sentinel modules in the [common functions](./common-functions) directory:
  * [tfplan-functions](./common-functions/tfplan-functions)
  * [tfstate-functions](./common-functions/tfstate-functions)
  * [tfconfig-functions](./common-functions/tfconfig-functions)
  * [tfrun-functions](./common-functions/tfrun-functions)
  * [report](./common-functions/report)

There are also some functions that can be used with the AWS, Azure, and GGP providers in [aws-functions](./aws/aws-functions), [azure-functions](./azure/azure-functions), and [gcp-functions](.gcp/gcp-functions) and some functions that can be used when talking to module registries in [registry-functions](./cloud-agnostic/http-examples/registry-functions).

All of the common functions that use any of the 4 Terraform Sentinel imports (tfplan/v2, tfstate/v2, tfconfig/v2, and tfrun) are defined in a single file. This makes it easier to import all of the functions that use one of those imports into the Sentinel CLI test cases and Terraform Cloud policy sets, since those only need a single stanza such as this one for each module:
```
"modules": {
  "tfplan-functions": {
    "path": "../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
  }
}
```

Each Sentinel function has a corresponding Markdown file in the same module folder describing the function, its declaration, its arguments, other common functions it uses, what it returns, and what it prints. It also gives examples of calling the function and sometimes lists some policies that call it.

The `report` module contains necessary logic to pretty print policy evaluation results.

Documentation for each individual function can be found in these directories:
  * [tfplan-functions](./common-functions/tfplan-functions/docs)
  * [tfstate-functions](./common-functions/tfstate-functions/docs)
  * [tfconfig-functions](./common-functions/tfconfig-functions/docs)
  * [tfrun-functions](./common-functions/tfrun-functions/docs)

### The Functions of the report Module
The `report` module has the following functions:
  * The `generate_policy_report` function accepts a `summary` object and pretty prints the policy evaluation results. More information about this function can be found [here](./common-functions/report/docs)

### The Functions of the registry-functions Module
The `registry-functions` module (which is located in the cloud-agnostic/http-examples/registry-functions directory) has the following functions:
  * The `get_recent_module_versions` function finds recent versions for private or public modules from a private module registry (PMR).
  * The `get_recent_module_versions_by_page` function finds recent versions for private or public modules from a private module registry (PMR) one page at a time. It is called by the `get_recent_module_versions` function. Having a separate function that deals with pagination keeps the interface for the `get_recent_module_versions` function cleaner.
  * The `find_most_recent_version` function finds the most recent versing string from a map of version strings.
  * The `is_module_in_public_registry` function determines if a module is in the public module registry.

Documentation for each individual function can be found in this directory:
    * [registry-functions](./cloud-agnostic/http-examples/registry-functions/docs)

## Mock Files and Test Cases
Sentinel [mock files](https://www.terraform.io/docs/enterprise/sentinel/mock.html) and [test cases](https://docs.hashicorp.com/sentinel/commands/config#test-cases) have been provided under the test directory of each cloud so that all the policies can be tested with the [Sentinel CLI](https://docs.hashicorp.com/sentinel/commands). The mocks were generated from actual Terraform 0.12 plans run against Terraform code that provisioned resources in these clouds. The pass and fail mock files were edited to respectively pass and fail the associated Sentinel policies. Some policies, including those that have multiple rules, have multiple fail mock files with names that indicate which condition or conditions they fail.

## Testing Policies
To test the policies of any of the clouds, please do the following:
1. Download the Sentinel CLI from the [Sentinel Downloads](https://docs.hashicorp.com/sentinel/downloads) page. (Be sure to use Sentinel 0.15.2 or higher.)
1. Unzip the zip file and place the sentinel binary in your path.
1. Clone this repository to your local machine.
1. Navigate to any of the cloud directories (aws, azure, gcp, or vmware) or to the cloud-agnostic directory.
1. Run `sentinel test` to test all policies for that cloud.
1. If you just want to test a single policy, run `sentinel test <policy_name>` where \<policy_name\> is the policy name.

Adding the `-verbose` flag to the above commands will show you the output that you would see if running the policies in TFC or TFE.