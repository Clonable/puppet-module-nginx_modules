class nginx_modules (
  String $nginx_version,
  String $output_folder = $nginx_modules::params::output_folder,
  ) inherits nginx_modules::params {

  contain nginx_modules::install
}
