

module "gtm" {
  source                 = "../../modules"
  tldn_gslb_cluster_name = "clusterX_example_com"
  which_az               = "us-west-2"
}


