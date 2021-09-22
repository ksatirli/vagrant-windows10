# configuration
MAKEFLAGS      = --no-builtin-rules --silent --warn-undefined-variables
SHELL         := sh

.DEFAULT_GOAL := help
.ONESHELL     :
.SHELLFLAGS   := -eu -c

BOX_ZIP_URL   = https://az792536.vo.msecnd.net/vms/VMBuild_20190311/Vagrant/MSEdge/MSEdge.Win10.Vagrant.zip
BOX_FILE      = "box.zip"

# configuration
color_off    = $(shell tput sgr0)
color_bright = $(shell tput bold)

# convenience function to alert user to missing target
define missing_target
	$(error Missing target. Specify with `target=<provider>`)
endef

.SILENT .PHONY: clear
clear:
	clear

.SILENT .PHONY: help
help: # Displays this help text
	$(info )
	$(info $(color_bright)VAGRANT: WINDOWS 10$(color_off))
	grep \
		--context=0 \
		--devices=skip \
		--extended-regexp \
		--no-filename \
			"(^[a-z-]+):{1} ?(?:[a-z-])* #" $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*?# "}; {printf "\033[1m%s\033[0m;%s\n", $$1, $$2}' | \
	column \
		-c2 \
		-s ";" \
		-t
	$(info )


.SILENT .PHONY: up
up: # Starts and provisions the Vagrant environment
	vagrant up

.SILENT .PHONY: reprovision
reprovision: # reprovisions the Vagrant environment
	vagrant up --provision

.SILENT .PHONY: get-box
get-box: # fetches upstream file with Vagrant Box
	curl \
		--location \
		--output "${BOX_FILE}" \
		"${BOX_ZIP_URL}"

.SILENT .PHONY: unpack-box
unpack-box: # unpacks ZIP archive of upstream Vagrant Box
	unzip \
		-u \
		"${BOX_FILE}"

.SILENT .PHONY: install-extpack
install-extpack: # installs VirtualBox Extension Pack (macOS with Homebrew only)
	brew \
		install \
			--cask "virtualbox-extension-pack"
