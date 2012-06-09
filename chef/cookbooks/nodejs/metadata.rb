name              "nodejs"
maintainer        "Phil Cohen"
maintainer_email  "github@phlippers.net"
license           "MIT"
description       "Installs Node.js"
long_description  "Please refer to README.md"
version           "1.0.0"

recipe "nodejs", "Sets up the apt repository and installs dependent packages"
recipe "nodejs::dev", "Install the development libraries"
recipe "nodejs::npm", "Install npm"

supports "ubuntu"
