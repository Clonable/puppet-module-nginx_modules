# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include dnsdist::params
class nginx_modules::params {
  $output_folder = '/usr/lib/nginx/modules/'
  $build_path = '/root/nginx_modules'
  $env_path = '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin'
}
