# Nginx modules

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with nginx_modules](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with nginx_modules](#beginning-with-nginx_modules)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module can be used to compile and install nginx modules from git sources.

## Setup

### Setup Requirements

This module requires the `archive` and `vcsrepo` modules. You are responsible for installing required packages to build the modules.

### Beginning with nginx_modules

To initialize the nginx source directory used to compile use the following class:
```
class {'nginx_modules' : 
    nginx_version => '1.20.1',
}

```

## Usage

### Simple setup with the circle_gif module

```
class {'nginx_modules' : 
    nginx_version => '1.20.1',
}

nginx_modules::module{'ngx_http_modsecurity_module':
    source     => 'https://github.com/evanmiller/nginx_circle_gif',
    vcs_commit => '4631d75be7b5c46aef7fee2438eec84081bb406b',
}
```


## Development

Pull requests can be opened at the [Github Repository](https://github.com/Clonable/puppet-module-nginx_modules).

[1]: https://puppet.com/docs/pdk/latest/pdk_generating_modules.html
[2]: https://puppet.com/docs/puppet/latest/puppet_strings.html
[3]: https://puppet.com/docs/puppet/latest/puppet_strings_style.html
