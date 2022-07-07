<img src= "sonic.png" />
<h3>
This Terraform Project creates an RDS Databse running MySQL 5.7 and runs on an EC2 instance with WordPress pre-installed and configured </h3>
 
 <p>
 The resources provisioned by this template is AWS FREE TRIAL friendly</p> 
 
 <h3>Please make sure you change the database entries ,regions and other variables in the terraform.tfvars file
 You will also need to update the  Database password in the user.tfvars file </h3>
<h3>
Information
</h3>

<p>This script uses the Ubuntu 20.04 LTS focal EC2 AMI, (see https://cloud-images.ubuntu.com/locator/ec2/ for more details) so please make sure you're in the correct region and you have the ami id for that region before initalizing Terraform..

Ansible should be installed and the aws CLI configured properly on the local machine. 
Please note the playbook_test.yml file will use an ansible script which has been designed and tested on Ubuntu focal distribution.

</p>
  --------------------------------------------------------------------------------
 <h3> Security: </h3>
<p> An EC2 will be launched in a public subnet and RDS backend database will be launched across two private subnets </p>
<p> Only an EC2 with a defined security group can access the RDS instance and the RDS instance will not have have internet access </p>
<p> The other native AWS applications will be setup as part of the initial infrastructure build.
<p> A load balancer will sit in front of the application and accept requests via port 80 and will be mapped to the host port</p> 

<p>Some of the native applications installed will be AWS Security Groups, VPCs, routing tables, and an Elastic Loadbalancer attached to a Autoscaling Group with an ASG policy. 

As an extra, a CloudWatch alarm is pre-configured to monitor CPU metrics, utilization and behaviour. An event will trigger if certain conditions are met such and there is a problem with the EC2 node</p>


<-------------------------------------------------------------------------------->

<h2> Prerequisite </h2>
<p> Before launching this Terraform template, the aws cli should be installed and configured with the correct access and secret keys </p>
<p> Terraform should be correctly installed and configured to run on your device or machine </p>
<p> Ansible should be installed and configured.
<p> You should  configure the AWS CLI using <code> aws configure </code> if you haven't already done so </p>

<-------------------------------------------------------------------------------->

<h2> Quick start steps: </h2>

 <p>Clone this repo using this command <code>  git clone https://github.com/dannellstjn/terraform-iaac.git</code></p>
 <p> Go to the project folder         <code>  cd terraform-iaac </code></p>
 <p>Initialize terraform          <code>  terraform init</code></p>
 <p>Change the database and aws settings in terraform.tfvars file </p>
 <p>Generate Key pair using        <code> ssh-keygen -f <mykey-pair>  </code></p>
 <p>View the Plan               <code> terraform plan -var-file="user.tfvars"  </code></p>
 <p>Apply changes to the plan once you are happy everything is in order           <code> terraform apply -var-file="user.tfvars" </code></p>
 
 <p> After successfull provisioning of AWS Resources (using the remote-exec provisioner) and your private key, an EC2 instance will have the capability to establish a connection to the host using SSH. The Ubuntu package manager will be updated, and Python will be installed. This will allow the local ansible server to connect to a provisoned EC2 Instance. After the Installation is completed (using a local exec provisioner) the Ansible playbook will be run against the instance and output the RDS endpoint and an Elastic (static) IP address </p>

 <p> Everything is Automated. This template will help to stand up a functional development site running the WordPress application, and prep for a production ready environment, it  will build components needed  and start the Webserver using a playbook script </h3>

 <p>Don't forget to destroy all the resources created by Terraform to avoid any unwanted charges to your AWS account! <code> terraform destroy -var-file="user.tfvars" </code></p>

<h3>Please do get in touch if you have any questions, comments or suggestions for improvement! Maybe you can raise a PR too.</h2>



