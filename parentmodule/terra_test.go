package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformHelloWorldExample(t *testing.T) {
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "./",
	})

	// destroy resources at the end
	defer terraform.Destroy(t, terraformOptions)

	// init and apply Terraform
	terraform.InitAndApply(t, terraformOptions)

	// no output assertion
}
