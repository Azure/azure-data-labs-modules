package test

import (
	// "os"
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestModule(t *testing.T) {
	t.Parallel()

	// Set up expected values to be checked later
    // email := os.Getenv("USER_EMAIL")
	// objectId := os.Getenv("USER_OBJECT_ID")
	// tenantId := os.Getenv("USER_TENANT_ID")

	terraformOptions := &terraform.Options{
		TerraformDir: "./",
		Lock: true,
		LockTimeout: "1800s",
		// VarFiles: []string{"terraform_unitest.tfvars"},

		// Variables to pass to our Terraform code using -var options
        // Vars: map[string]interface{}{
		// 	"aad_login": map[string]interface{}{
		// 		"name": email,
		// 		"object_id": objectId,
		// 		"tenant_id": tenantId,
		// 	  },
        // },
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

	// Try to remove the default adls from the state
}