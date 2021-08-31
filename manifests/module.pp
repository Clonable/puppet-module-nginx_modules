# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
define nginx_modules::module (
  String $source,
  String $vcs_commit,
) {
  include ::nginx_modules::install
  include ::nginx_modules::params

  $build_path = $::nginx_modules::install::build_path
  $nginx_src_path = $::nginx_modules::install::nginx_src_path

  vcsrepo {"${build_path}/${title}_src":
    ensure   => 'latest',
    force    => true,
    provider => git,
    source   => $source,
    revision => $vcs_commit,
    require  => Archive["${build_path}/nginx.tar.gz"],
  }

  exec { "configure_${title}_module":
    command     => "./configure --with-compat --add-dynamic-module=../${title}_src",
    cwd         => $nginx_src_path,
    path        => "${nginx_src_path}:${::nginx_modules::params::env_path}",
    require     => [Vcsrepo["${build_path}/${title}_src"]],
    refreshonly => true,
    subscribe   => Vcsrepo["${build_path}/${title}_src"]
  }

  exec { "compile_${title}_module":
    command     => 'make modules',
    cwd         => $nginx_src_path,
    path        => $::nginx_modules::params::env_path,
    creates     => "${nginx_src_path}/objs/${title}.so",
    require     => Exec["configure_${title}_module"],
    refreshonly => true,
    subscribe   => Exec["configure_${title}_module"],
  }

  file { "${nginx_modules::output_folder}/${title}.so":
    ensure  => 'link',
    target  => "${nginx_src_path}/objs/${title}.so",
    require => [Exec["compile_${title}_module"], Package['nginx']],
  }

}
