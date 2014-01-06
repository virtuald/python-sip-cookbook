python-sip
==========

This cookbook installs the SIP package for python from a source distribution. 


Requirements
============

Tested on chef 10.14.2. 


Attributes
==========

* `node['python-sip']['python_version']` - Specify the python version to 
  use to configure & install SIP for. Defaults to `2`. 
* `node['python-sip']['python_cmd']` - Use this to specify the python command
  to use to configure & install SIP for. Defaults to `python2`.
* `node['python-sip']['version']` - Version of SIP to install
* `node['python-sip']['uri']` - URI of SIP tarball


Recipes
=======

default
-------

Calls the `install_source` recipe

install_source
--------------

Downloads the sip tarball, extracts, and installs it. 


Contribute
==========

1. Fork the repository
2. Make changes
3. Submit a pull request

Authors
=======

Author:: Dustin Spicuzza (dustin@virtualroadside.com)
