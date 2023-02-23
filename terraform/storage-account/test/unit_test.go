package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"os"
)

func TestModule(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "./",
		Lock: true,
		LockTimeout: "1800s",
		// VarFiles: []string{"terraform_unitest.tfvars"},
		Vars: map[string]interface{}{
            "firewall_virtual_network_subnet_ids": []string{os.Getenv("HA_SUBNET_ID")},
        },
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// Is used mainly for debugging, fail early if plan is not possible
	terraform.InitAndPlan(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Check if the outputs exist
	assert := assert.New(t)
	id := terraform.Output(t, terraformOptions, "id")
	assert.NotNil(id)
	name := terraform.Output(t, terraformOptions, "name")
	assert.NotNil(name)
	resource_group_name := terraform.Output(t, terraformOptions, "resource_group_name")
	assert.NotNil(resource_group_name)
	access_key := terraform.Output(t, terraformOptions, "access_key")
	assert.NotNil(access_key)
	adls_id := terraform.Output(t, terraformOptions, "adls_id")
	assert.NotNil(adls_id)
}