terraform {
  required_providers {
    terratowns = {
      source  = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  cloud {
    organization = "TerraFusion"
    workspaces {
      name = "terra-house-1"
    }
  }
}
provider "terratowns" {
  endpoint  = var.terratowns_endpoint
  user_uuid = var.teacherseat_uuid
  token     = var.terratowns_access_token

}
module "home_gta_hosting" {
  source          = "./modules/terrahome_aws"
  user_uuid       = var.teacherseat_uuid
  public_path     = var.gta.public_path
  content_version = var.gta.content_version
}

resource "terratowns_home" "home_gta" {
  name        = "How to play GTA in 2023!"
  description = <<DESCRIPTION
Grand Theft Auto is a series of action-adventure games created by David Jones and Mike Dailly.
Later titles were developed under the oversight of brothers Dan and Sam Houser, Leslie Benzies and Aaron Garbut.
It is primarily developed by British development house Rockstar North (formerly DMA Design), and published by its American parent company, Rockstar Games. 
The name of the series is a term for motor vehicle theft in the United States.
DESCRIPTION
  domain_name = module.home_gta_hosting.domain_name
  # domain_name     = "3efefdxq3gz.cloudfront.net"
  town            = "gamers-grotto"
  content_version = var.gta.content_version
}

module "home_payday_hosting" {
  source          = "./modules/terrahome_aws"
  user_uuid       = var.teacherseat_uuid
  public_path     = var.payday.public_path
  content_version = var.payday.content_version
}

resource "terratowns_home" "home_burger" {
  name            = "Making your Burgers!!"
  description     = <<DESCRIPTION
A hamburger, or simply burger, is a sandwich consisting of fillings—usually a patty of ground meat, 
typically beef—placed inside a sliced bun or bread roll.
DESCRIPTION
  domain_name     = module.home_payday_hosting.domain_name
  town            = "cooker-cove"
  content_version = var.payday.content_version
}