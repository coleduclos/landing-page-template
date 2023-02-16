terraform {
    required_version = ">= 1.0"
}

module "website" {
    source = "github.com/coleduclos/tf-modules-s3-static-website"
    certificate_arn = var.certificate_arn
    error_document_key = "index.html"
    public_hosted_zone_name = var.public_hosted_zone_name
    tags = local.tags
}