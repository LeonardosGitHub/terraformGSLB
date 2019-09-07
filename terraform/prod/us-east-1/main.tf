

module "gtm" {
  source                 = "../modules"
  tldn_gslb_cluster_name = "clusterX_example_com"
  which_az               = "us-east-2"
}

/*
module "gtm_oregon" {
  source = "../modules"
  tldn_gslb_cluster_name = "tldn_gslb"
  which_az = "us-west-2"
}
*/
