# @summary Manages the dnsdist package
#
#
# @api private
class nginx_modules::install inherits nginx_modules::params{
  $build_path = $nginx_modules::params::build_path
  $nginx_src_path = "${build_path}/nginx-${::nginx_modules::nginx_version}"

  include 'archive'

  file {$build_path:
    ensure => 'directory'
  }

  archive {"${build_path}/nginx-${::nginx_modules::nginx_version}.tar.gz":
    ensure       => present,
    source       => "https://nginx.org/download/nginx-${::nginx_modules::nginx_version}.tar.gz",
    extract_path => $build_path,
    extract      => true,
  }
}
