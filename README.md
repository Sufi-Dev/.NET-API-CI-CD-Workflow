<img src="https://raw.githubusercontent.com/Sufi-Dev/weatherapi/Sufi-Dev-Test/weatherapi.png" >

## Project Info <img src="https://raw.githubusercontent.com/Sufi-Dev/Sufi-Dev/main/icons/info.gif" width="30" height="30">
This web API gives you information about the weather from all over the world.
The API is connected to CosmosDB, an Azure NoSQL database.
## Project Map 🗾
1) **CI/CD piplines**: I used Azure DevOps to set up fully automated CI/CD piplines.<br>
   Checkout the code for the pipeline in [`azure-pipelines.yml`](https://github.com/Sufi-Dev/weatherapi/blob/main/azure-pipelines.yml)as well as the Docker file in [`Dockerfile`](https://github.com/Sufi-Dev/weatherapi/blob/main/Dockerfile)<br>
2) **Terraform**: I provisioned cloud infrastructued using terraform.<br>
checkout terraform files in the [`terraform`](https://github.com/Sufi-Dev/weatherapi/tree/main/terraform) directory.
```
tree ./terraform 
├── main.tf
├── modules
│   ├── compute
│   │   └── vm
│   │       ├── main.tf
│   │       ├── terraform.tfvars
│   │       └── variable.tf
│   ├── network
│   │   └── vnet
│   │       ├── maint.tf
│   │       └── variable.tf
│   ├── security
│   │   └── network_security_group
│   │       ├── maint.tf
│   │       └── variable.tf
│   └── storage
│       └── cosmosDB
│           ├── main.tf
│           └── variable.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
└── variables.tf
```
3) **Ansible**: Configured the provisioned server using ansible playbook automatically after terraform completed building the infrastructure.
checkout ansible playbook in the [`ansible`](https://github.com/Sufi-Dev/weatherapi/tree/main/ansible) directory.

## Tools 🛠
Azure <a href="https://azure.microsoft.com/en-in/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/Sufi-Dev/Sufi-Dev/main/icons/azure.svg" alt="azure" width="40" height="40"/></a>
Terraform <a href="https://azure.microsoft.com/en-in/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/Sufi-Dev/Sufi-Dev/main/icons/terraform.svg" alt="azure" width="40" height="40"/></a>
Linux <a href="https://www.linux.org/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/Sufi-Dev/Sufi-Dev/main/icons/linux.svg" alt="linux" width="40" height="40"/> </a>
NoSQL <a href="https://azure.microsoft.com/en-in/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/Sufi-Dev/Sufi-Dev/main/icons/nosql.svg" alt="azure" width="40" height="40"/> </a>

## Related Pojects 🔗
I deployed the same web API in a **Blue Green deployment** architecture. See the link below:<br>
[Automated cloud infrastructure deployment using Terraform based on (Blue Green) deployment architecture](https://github.com/Sufi-Dev/Blue-Green-Deployment)



