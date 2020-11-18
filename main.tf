module "instance1" {
  source = "./modules/foobar"
  name    = "instance1"
  }


module "instance2" {
  source = "./modules/foobar"
  name =   "instance2"
  depends_list = [module.instance1.depend_on]
}


module "instance3" {
  source = "./modules/foobar"
  name  = "instance3"
  depends_list = [module.instance2.depend_on]
}