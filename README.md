<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>

  <h1>Terraform Three-Tier Architecture on AWS</h1>

  <p>This project sets up a complete three-tier architecture using Terraform, including networking, compute (EC2), a database layer, and an Application Load Balancer.</p>

  <h2>Project Structure</h2>
  <pre>
3-tier-webapp/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── Modules/
│   ├── Networking/
│   │   ├── vpc.tf
│   │   ├── subnets.tf
│   │   ├── securitygroups.tf
│   │   ├── nat.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   ├── Compute/
│   │   ├── ec2.tf
│   │   ├── alb.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   ├── Database/
│   │   ├── rds.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
  </pre>

  <h2>Modules Description</h2>

  <h3>1. Networking Module</h3>
  <ul>
    <li>Creates a VPC</li>
    <li>Creates public and private subnets across multiple Availability Zones</li>
    <li>Configures Internet Gateway, NAT Gateway, and route tables</li>
    <li>Creates security groups</li>
  </ul>

  <h3>2. Compute Module</h3>
  <ul>
    <li>Launches frontend and backend EC2 instances</li>
    <li>Attaches instances to public/private subnets respectively</li>
    <li>Creates an Application Load Balancer with a target group</li>
    <li>Attaches frontend and backend instances to the ALB target group</li>
  </ul>

  <h3>3. Database Module</h3>
  <ul>
    <li>Creates an RDS instance (MySQL/PostgreSQL)</li>
    <li>Places RDS in private subnets for security</li>
    <li>Uses a database subnet group for multi-AZ deployments</li>
    <li>Connects with EC2 backend and protected by SG rules</li>
  </ul>

  <h2>Usage</h2>

  <h3>1. Clone the Repository</h3>
  <pre>git clone https://github.com/your-username/3-tier-webapp.git</pre>

  <h3>2. Initialize Terraform</h3>
  <pre>terraform init</pre>

  <h3>3. Configure Variables</h3>
  <p>Edit <code>terraform.tfvars</code> with:</p>
  <ul>
    <li>VPC CIDR and subnet CIDRs</li>
    <li>AMI ID and instance type</li>
    <li>Database username, password, and engine</li>
    <li>Key pair name for EC2 access</li>
  </ul>

  <h3>4. Plan and Apply</h3>
  <pre>
terraform plan
terraform apply
  </pre>

  <h2>Important Notes</h2>
  <ul>
    <li>Ensure public subnets are in at least 2 different Availability Zones for ALB.</li>
    <li>EC2 <code>subnet_id</code> should not be a list; use <code>public_subnet_ids[0]</code> or similar.</li>
    <li>Expose VPC ID, subnet IDs, and SG IDs from networking module outputs.</li>
    <li>RDS subnet group should contain private subnets only.</li>
    <li>Use outputs from database module to connect backend to DB (e.g. hostname).</li>
  </ul>

  <h2>Author</h2>
  <p>Created by <strong>Your Name</strong> | <a href="mailto:your.email@example.com">your.email@example.com</a></p>

</body>
</html>
