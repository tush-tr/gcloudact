## What is Gcloudact ?
**Gcloudact** is a Terraform module to automate the deployment and hosting process of your own runners on Google cloud to run jobs in your GitHub Actions workflows. It makes it easy to automate all your software workflows, now with world-class CI/CD. Build, test, and deploy your code right from GitHub.

## Why Gcloudact?
Gcloudact sets up a self-hosted runner on the cloud. Self-hosted runners offer more control of hardware, operating system, and software tools than GitHub-hosted runners provide. With self-hosted runners, you can choose to create a custom hardware configuration with more processing power or memory to run larger jobs, install software available on your local network, and choose an operating system not offered by GitHub-hosted runners. You can read more about self-hosted runner <a href="https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners">here</a>.


## Prerequisites ✅

**Terraform and Gcloud Shell** 
Ensure you're running scripts on gcloud shell

- On your gcloud shell

```bash
git clone https://github.com/tush-tr/gcloudact
```

**Github personal access token**

The module requires Github personal access token for the admin access to the repository and to configure the runner. You can create a personal access token by following this [tutorial](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line).

## Usage ⚙️

Update the values inside [terraform.tfvars](./terraform.tfvars) file for better experience.

Run the following commands to use the module:

To initialize Terraform:
```bash
$ terraform init
```
To inspect the resources that will be created:

```bash
$ terraform plan
```
To deploy the runner  :
```bash
$ terraform apply
```


To delete the runner :
```bash
$ terraform destroy
```

> **Note**: The above command will use the default values defined inside [variables.tf](./variables.tf) file. You can change the values if required.

# Contributing 🍻

I welcome pull requests, bug fixes and issue reports. Before proposing a change, please discuss your change by raising an issue.

# Maintainer 😎

[Tushar Rajpoot](https://twitter.com/tush_tr604)


## License

[Apache License 2.0](LICENSE) © Tushar Rajpoot