
default['python-sip']['version'] = '4.15.3'
default['python-sip']['uri'] = "http://sourceforge.net/projects/pyqt/files/sip/sip-#{node['python-sip']['version']}/sip-#{node['python-sip']['version']}.tar.gz"

default['python-sip']['python_version'] = 2
default['python-sip']['python_cmd'] = "python#{node['python-sip']['python_version']}"
