<img src= "" />
<h3>
This terraform projects creates
RDS databse with mysql 5.7 
 
#EC2 instance with wordpress pre installed and configured </h3>
 
 <h2>
 AWS FREE TRIAL friendly</h2> 
 
 <h3>Please make sure you make changes to the database entries ,regions and other variables in the terraform.tfvars file
 You will also need to update the  Database password in user.tfvars file </h3>
<h3>
Overview:

This script uses the Ubuntu 20.04 LTS focal EC2 AMI, (see https://cloud-images.ubuntu.com/locator/ec2/ for more details), please make sure you are in the correct region and you have the ami id for that region.

A recent version of Ansible installed and a correctly configured aws CLI on your local machine. 
Please note that the playbook_test.yml file uses an ansible script designed for the Ubuntu distribution.

</h3>
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

 <p>Clone this repo using this command <code>  git clone my-repot</code></p>
 <p> Go to the project folder         <code>  cd terraform-ansible-wordpress </code></p>
 <p>Initialize terraform          <code>  terraform init</code></p>
 <p>Change the database and aws settings in terraform.tfvars file </p>
 <p>Generate Key pair using        <code> ssh-keygen -f mykey-pair  </code></p>
 <p>View Plan using                <code> terraform plan -var-file="user.tfvars"  </code></p>
 <p>Apply the plan using           <code> terraform apply -var-file="user.tfvars" </code></p>
 
 <p> After successfull provisioning of AWS Resources, using the remote-exec provisioner and your private key, an EC2 instance will be connected via  SSH. The apt package manager will be updated and Python will be installed, this will enable the local ansible server to connect to the provisoned EC2 Instance. Once the Installation is completed using the local exec provisioner, the Ansible playbook will be run against provisioned EC2 </p>
 <h3> Everything is Automated. This template will provision all the required aws resources, it will also build and start a webserver using Ansible </h3>

 <p>Please remember to destroy your Infrastructure to avoid charges outside of the Free Tier   <code> terraform destroy -var-file="user.tfvars" </code></p>





