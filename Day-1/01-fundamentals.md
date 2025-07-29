# Infrastructure as Code (IAC)

Before the advent of IAC, infrastructure management was typically a manual and time-consuming process. System administrator and operations teams had to:

1. **Manually Configure Servers**: Servers and other infrastructure components were often set up and configured manually, which could lead to inconsistencies and errors.

2. **Lack of Version Control**: Infrastrucutre configurations were not typically version-controlled, making it difficult to track changes or revert to previous state.

3. **Documentation Heavy**: Organisations relied heavily on documentation to record the steps and configurations required for different infrastructure setups. This documentation could become outdated quickly.

4. **Limited Automation**: Automation was limited to basic scripting, often lacking the robustness and flexibility offerend by modern IAC tools.

5. **Slow Provisioning**: Provisioning new resources or environments was a time-consuming process that involved multiple manual steps, leading to delays in project delivery.


IAC addresesses these challanges by providing a systematic, automated, and code-driven approach to infrastructure management.
Popular IAC tools include Terraform, AWS CloudFormation, Azure Resource Manager templates, Pulumi and others.

These tools enable organisations to define, deploy and manage their infrastructure efficiently and consistently, making it easier to adapt to the dynamic needs to modern applications and services.


# Why Terraform?

There are multiple reasons why Terraform is used over the other IAC tools but below are the main reasons.

1. **Multi-Cloud Support**: Terraform is knows for it's multi-cloud support. It allows you to define infrastructure in a cloud-agnostic way, meaning you can use the same configuration code to provision resources on various cloud providers (AWS, Azure, Google Cloud, etc.) and even on-premises infrastructure. This flexibility can be beneficial if your organisation uses multiple cloud providers or plans to migrate between them.

2. **Large Ecosystem**: Terraform has a vast ecosystem of providers and modules contributed by both HashiCorp (the company behind Terraform) and the community. This means you can find pre-built modules and configurations for a wide range of services and infrastructure components, saving you time and effort in writing custom configurations.

3. **Declarative Syntax**: Terraform lets you define the end-state of your infrastructure using HCL. It automatically translates this into the required API calls for your cloud provider, doing the heavy lifting behind the scenes. This makes your code clean, maintainable, and easy to manage.

4. **State Management**: Terraform maintains a state file that tracks the current state of your insfrastructure. This state file helps Terraform understand the differences between the desired and actual states of your infrastructure, enabling it to make informed decision when you apply changes.

5. **Plan and Apply**: Terraform's "plan" and "apply" workflow allows you to preview changes before applying them. This helps prevent unexpected modifications to your infrastructure and provides an opportunity to review and approve changes before they are implemented.

6. **Community Support**: Terraform has a large and active user community, which means you can find answers to common questions, troubleshooting tips, and a wealth of documentation and tutorials online.

7. **Integration with Other Tools**: Terraform can be integrated with other DevOps and automation tools, such as Docker, Kubernetes, Anisble, and jenkins, allowing you to create comprehensive automation pipelines.

8. **HCL Language**: Terraform uses HashiCorp Configuration Language (HCL), which is designed specifically for defining infrastrucuture. It's human-readale and expressive, making it easier for both developers and operators to work with.

