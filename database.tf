#create database 
#3) to create database means aws_db_instance we need database subnet group so we have to write down that first before aws_db_instance..lets do write db subnetgroup
#2)to write two subnet ids db1 and db2 in one go we need to write aws_subnets resource here first before we define resource "aws_db_subnet_group"
#1)so lets create  data "aws_subnets" "name" { from data source

data "aws_subnets" "db" {
  filter {
    name   = "tag:Name"
    values = var.db_subnet_names # insert values here
  }
  depends_on = [aws_subnet.subnets]
}




resource "aws_db_subnet_group" "ntier" {
  #subnet_ids = [aws_subnet.subnets[4].id, aws_subnet.subnets[5].id] #writing like this ok for now but in future the db1 and db2 


  #might not be as 4th and 5th index of values might be any random number so
  name = "ntier" # so to avoid this we need to use little creativity here. so lets put comments
  # for this [aws_subnet.subnets[4], aws_subnet.subnets[5]
  subnet_ids = data.aws_subnets.db.ids
  tags = {
    Name = "ntier"
  } #but here 2 db subnets we have to write together in one go but this is not possible like this so
  #to do that we need to write one morething before this which is aws_subnets so lets create resource 
  #for that above as resource "aws_subnet
  depends_on = [
    aws_subnet.subnets,
    data.aws_subnets.db
  ]
}


resource "aws_db_instance" "ntierdb" {
  allocated_storage      = 20
  db_name                = "emp"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = "user"
  password               = "useruser"
  db_subnet_group_name   = aws_db_subnet_group.ntier.name
  skip_final_snapshot    = true
  identifier             = "mydbfromtf"
  vpc_security_group_ids = [aws_security_group.dbsg.id]

  depends_on = [
    aws_subnet.subnets,
    data.aws_subnets.db,
    aws_db_subnet_group.ntier
  ]


}