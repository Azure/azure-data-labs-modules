package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestModule(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "./",
		Lock: true,
		LockTimeout: "1800s",
		// VarFiles: []string{"terraform_unitest.tfvars"},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// Is used mainly for debugging, fail early if plan is not possible
	terraform.InitAndPlan(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Check if the outputs exist
	assert := assert.New(t)
	list := terraform.Output(t, terraformOptions, "list")
	assert.NotNil(list)
}