# AWS Terraform POC project
A first step to infrastructure as code for an AWS Estate.

## Prequisite
- Terraform CLI
- AWS CLI
- Python
- GraphViz (optional)


## Key terraform commands
key chain:
- init
- validate
- plan
- apply
- destroy

other:
- show
    - shows current state
- state list
    - list resources in your project's state
- graph
    - outputs resources into DOT format on the cli. Can convert this to an image using tools e.g. GraphViz
    - terraform graph | dot -Tsvg > graph.svg

## Terraform files
### Each module
- main.tf
    - the main terraform configuration file
- variables.tf  (like function arguments)
    - define input variables to substitue into main.tf
- outputs.tf    (like function return values)
    - Allows us to export structured data about our resources. i.e. essentially to get information about the resources deployed
    - this is also necessary to share data from a child module to your root module

### Module blocks
- A module is a container for multiple resources that are used together.
- Each terraform configruation should have at least one module, root module which call other modules.

## Useful notes
- cidr_block / cidr_blocks
    - block for VPC resource, subnets, rt routes. etc
    - blocks for security group
- Referencing resources that aren't yet created
    - aws_vpc.first-vpc.id

## Repo instructions
Uncomment access/ secret key variables in root/main.tf and variables.tf if need that input.

if using tfvars, rename terraform.tfvars.disabled to teraform.tfvars:
- terraform plan/ apply should work automatically. Otherwise try manually below:
    - terraform plan -var-file="terraform.tfvars"
    - terraform apply -var-file="terraform.tfvars"

if not:
- specify all required default values for root/variables.tf

## Possible Improvements
- modify setup to be scalable e.g. deploying 1-3 instances by variable input
- variables requiring default inputs are currently doubled up in root/variables.tf and module/variables.tf to allow tfvar inputs. Could possibly be change to avoid repeats?
- some resources currently share the same variables e.g. app ami/ api ami / db ami. This could be improved to allow resource dependant input customisation.
- a better naming convention and way to tag resources
- fine tuning EC2 resources
    - root volume sizing
    - attaching backup/ additional volumes
        - new or existing
    - elastic IPs
    - specify AMI per application instead of all base AMI
    - tagging
- networking
    - DNS hosting
    - SSL Certificates
    - architecture improvements
- Security
    - IAM 
        - Users / Groups
        - Roles
        - Policies
- Other services
    - S3 bucket