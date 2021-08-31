# dnsdist

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with dnsdist](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with dnsdist](#beginning-with-dnsdist)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module can be used to set up powerdns dnsdist servers. It supports acl's, actions, netmaskgroups and servers with various parameters.

## Setup

### Setup Requirements

This module requires the `apt`, `concat` and `stdlib` modules.

### Beginning with dnsdist

To set up a dnsdist server in an empty state (listening on local IP ranges and not having any backend servers), simply use:
```
class {'dnsdist' : }

dnsdist::instance{'dns-lb' }
```

## Usage

### Simple setup with one rate-limited backend server
Warning: the configuration below accepts queries from the internet.

```
class {'dnsdist' : }

dnsdist::instance{'dns-lb':
    acl                  => ['0.0.0.0/0'],
    additional_addresses => ['$::ipaddress']
}

dnsdist::server{'server-1':
    cluster_name => 'cluster-1',
    address      => '127.0.0.1:6500',
    qps          => 100,
}
```


## Development

Pull requests can be opened at the [Github Repository](https://github.com/Clonable/puppet-module-dnsdist).

[1]: https://puppet.com/docs/pdk/latest/pdk_generating_modules.html
[2]: https://puppet.com/docs/puppet/latest/puppet_strings.html
[3]: https://puppet.com/docs/puppet/latest/puppet_strings_style.html
