# Vagrant Box: Windows 10

> Windows 10 Vagrant Box with Chocolatey and HashiCorp Consul, Nomad, and Vault

## Table of Contents

- [Vagrant Box: Windows 10](#vagrant-box-windows-10-with-hashicorp-tools)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Usage](#usage)
  - [Notes](#notes)
  - [Author Information](#author-information)
  - [License](#license)

## Requirements

- Vagrant `2.2.18` or newer
- VirtualBox `6.1.26` or newer

## Usage

This repository contains a [Vagrantfile](./Vagrantfile) for a _Windows 10_-based box.

```text
VAGRANT: WINDOWS 10

help             Displays this help text
up               Starts and provisions the Vagrant environment
reprovision      reprovisions the Vagrant environment
get-box          fetches upstream file with Vagrant Box
unpack-box       unpacks ZIP archive of upstream Vagrant Box
install-extpack  installs VirtualBox Extension Pack (macOS with Homebrew only)
```

### Workflow

* Fetch a compressed version of the Vagrant Box from Microsoft by running `make get`
* Unpack the compressed version of the Vagrant Box by running `make unpack`
* Optionally, install the VirtualBox Extension Pack by running `make install-extpack`
  * This step requires [brew](https://brew.sh/) to be installed
* Start and provision the Vagrant environment by running `make up`
  * Optionally, re-provision the Vagrant environment by running `make reprovision`

## Author Information

This repository is maintained by the contributors listed on [GitHub](https://github.com/ksatirli/vagrant-windows10/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
