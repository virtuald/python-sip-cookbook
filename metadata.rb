name              "python-sip"
maintainer        "Dustin Spicuzza"
maintainer_email  "dustin@virtualroadside.com"
description       "Installs the SIP package"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.1.0'
license           'BSD'

%w{ debian ubuntu }.each do |os|
  supports os
end

depends 'build-essential'
