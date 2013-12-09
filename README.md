chef-beaver Cookbook
====================

python daemon that munches on logs and sends their contents to logstash


Requirements
------------

### packages
- `python`
- `virtualenv`
- `git`

### cookbooks
- `python`
- `runit`
- `build-essential`
- `git`

Resources and Providers
=======================

This cookbook provides two resources and corresponding providers.

`install.rb`
-------------

Actions:

* `install` - installs beaver
* `uninstall` - uninstalls beaver

`configure.rb`
-------------

Actions:

* `create` - creates a beaver process
* `destroy` - stops the beaver process

Attributes
----------

#### chef-beaver::install
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>install_uri</tt></td>
    <td>String</td>
    <td>If installing via the git protocol the fully qualified uri to resolve the package for beaver</td>
    <td><tt>git+git://github.com/josegonzalez/beaver.git#egg=beaver</tt></td>
  </tr>
  <tr>
    <td><tt>install_version</tt></td>
    <td>String</td>
    <td>If installing via PyPi package name and version to install</td>
    <td><tt>beaver==28</tt></td>
  </tr> 
  <tr>
    <td><tt>beaver_root</tt></td>
    <td>String</td>
    <td>Directory that we create a virtualenv instance in to install beaver in to</td>
    <td><tt>/opt/beaver</tt></td>
  </tr>
</table>

#### chef-beaver::configure
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>redis_url</tt></td>
    <td>String</td>
    <td>Fully qualified uri of the redis server configured for logstash e.g. <i>redis://172.29.11.1:6379/0</i></td>
    <td><tt>String.new</tt></td>
  </tr>
</table>

Usage
-----
#### chef-beaver::example

Provides an example of how to use this with a redis server to send your messages to

Just include `chef-beaver` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chef-beaver::example]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Scott M. Likens <scott@spam.likens.us>

Copyright 2013, Scott M. Likens

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
