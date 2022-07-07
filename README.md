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
<p> Other native AWS applications will be provisioned, as part of the base build. These include Security Groups, VPCs, attached routing tables, Elastic Loadbalancer, attached to an Autoscaling Group & Autoscaling group pPolicy, with an additional CloudWatch metrics alarm to monitor CPU utilization and behaviour.


<----------------------------------------------------------------------------------------------------------------------->

<h2> Prerequisite </h2>
<p> Before launching this Terraform template, the aws cli should be installed and configured with the correct access and secret keys </p>
<p> Terraform should be correctly installed and configured to run on your local machine </p>
<p> Ansible should be installed on your local machine.
<p> You can configure the AWS CLI using <code> aws configure </code> if you haven't already done so </p>

<------------------------------------------------------------------------------------------------------------------------>

<h2> STEPS: </h2>

 <p>Clone this repo using this command <code>  git clone https://github.com/dannellstjn/terraform-iaac.git</code></p>
 <p> Go to the project folder         <code>  cd terraform-iaac </code></p>
 <p>Initialize terraform          <code>  terraform init</code></p>
 <p>Change the database and aws settings in terraform.tfvars file </p>
 <p>Generate Key pair using        <code> ssh-keygen -f mykey-pair  </code></p>
 <p>View Plan using                <code> terraform plan -var-file="user.tfvars"  </code></p>
 <p>Apply the plan using           <code> terraform apply -var-file="user.tfvars" </code></p>
 
 <p> After successfull provisioning of AWS Resources, using the remote-exec provisioner and your private key, an EC2 instance will be connected via  SSH. The apt package manager will be updated and Python will be installed, this will enable the local ansible server to connect to the provisoned EC2 Instance. Once the Installation is completed using the local exec provisioner, the Ansible playbook will be run against provisioned EC2 </p>

 <h3> Everything is Automated. This template will provision all the required aws resources, it will also build and start a webserver using Ansible </h3>

 <p>Please remember to destroy your Infrastructure to avoid charges outside of the Free Tier   <code> terraform destroy -var-file="user.tfvars" </code></p>





