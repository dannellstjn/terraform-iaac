<img src= "sonic.png" />

<h2>IaaC using Terraform and friends</h2>
<p>
This Terraform Project creates an RDS Database instance with MySQL 5.7 installed and runing on an EC2 instance with the latest WordPress version pre-installed and configured!</h3>
 
 <p>
 The resources created using this template are AWS FREE TRIAL friendly!</p> 
 
<h3>Before you start</h3>
 <p>Make sure  database entries ,regions and other important variables have been changed in terraform.tfvars as required.
 You'll also need to update the Database password information in the user.tfvars file.</p>

<h3>
Some useful information
</h3>

<p>This script uses the Ubuntu 20.04 LTS focal EC2 AMI (see https://cloud-images.ubuntu.com/locator/ec2/ for details) so please make sure you're in the correct region, and you have the correct ami ids for that region before initalizing Terraform...

Ansible should be installed and the aws CLI configured correctly on your local machine. 
Keep in mind the playbook_test.yml is the ansible script designed and tested using the Ubuntu focal distribution. You can change this for your own playbook scripts once you have a PoC running.

</p>
  --------------------------------------------------------------------------------
 <h3> Security stuff </h3>
<p> An EC2 will be launched in a public subnet and RDS backend database will be launched across two private subnets </p>
<p> Only an EC2 with a defined security group can access the RDS instance and the RDS instance will not have have internet access </p>
<p> The other native AWS applications will be setup as part of the initial infrastructure build.
<p> A load balancer will sit in front of the application and accept requests via port 80 and will be mapped to the host port</p> 

<p>Some of the AWS resources provisioned will be AWS Security Groups, VPCs, routing tables, plus an Elastic Loadbalancer, attached to a Autoscaling Group with an ASG policy. 

For completion,  a CloudWatch alarm is pre-configured to monitor CPU metrics, utilization and behaviour. This means an event will be triggered if thresholds are breached or there is a problem affecting the node or underlying hardware</p>


<-------------------------------------------------------------------------------->

<h2> Some Prerequisites </h2>
<p> Before launching Terraform, the aws cli should be installed and configured with the correct access and secret keys </p>
<p> Terraform should be correctly installed and configured to run on your device or machine </p>
<p> Ansible should be installed, configured and ready to use.
<p> You can configure the AWS CLI using <code> aws configure </code> if you haven't already done so </p>

<-------------------------------------------------------------------------------->

<h2>A quick start guide: </h2>

 <p>Clone this repo using this command <code>  git clone https://github.com/dannellstjn/terraform-iaac.git</code></p>
 <p> Go to the project folder         <code>  cd terraform-iaac </code></p>
 <p>Initialize terraform          <code>  terraform init</code></p>
 <p>Change the database and aws settings in terraform.tfvars file </p>
 <p>Generate Key pair using        <code> ssh-keygen -f <mykey-pair>  </code></p>
 <p>View the Plan               <code> terraform plan -var-file="user.tfvars"  </code></p>
 <p>Apply changes to the plan once you are happy everything is in order           <code> terraform apply -var-file="user.tfvars" </code></p>
 
 <p> After successfull provisioning of the AWS Resources (using the remote-exec provisioner) and your private key, an EC2 instance will establish a connection to the host via SSH. 

<p>The local package manager will be updated, and Python will be installed. This will enable the local ansible server to connect to a provisioned EC2 instance.</p>
<p>After the Install is completed (using a local exec provisioner) the Ansible playbook will be run against the instance, and if there aren't any errors, it will output some data including the RDS endpoint and a Elastic (static) IP address. </p>
<p>A Load balancer has been added to the setup, this will make it easier when upgrading to a more secure option, using SSL/TLS protocol if you want to keep the site more secure during development stages!</p>

 <p> Remember everything is automatic, this template acts as a guide to help stand up a basic development website running the latest WordPress application preparing you for a pre-production ready environment, it will build the necessary resources required for a simple web application and then start the Webserver using the playbook script.</p>

 <p>Don't forget to destroy all resources created by Terraform. I would also recommend setting up a billing alert so you don't get caught out! This of course will help to avoid any unwanted charges to your AWS account! <code> terraform destroy -var-file="user.tfvars" </code></p>

<p>Please reach out if you have any questions, comments or suggestions for improvement!</p>



