# gdev-installer
gdev-installer is a tool for creating a compute instance for development purposes on Google Cloud Platform.

## Prerequisites

[gcloud cli tool](https://cloud.google.com/sdk/docs/)

## Installation

gdev-installer requires one command:
```bash
curl -L https://git.io/gdev-installer  | sh -
```

## Customizing the Installation

Environment variables can be used to customize the installation. Review the
[installer](https://github.com/danehans/gdev-installer/blob/master/install.sh) to learn more about the
supported options. Setting options take the form of:
```bash
export OPTION=VALUE
```

For example, to change the name of the GCP instance (defaults to "dev"):
```bash
export VM_NAME=my_gcp_instance
```

Then run the installer:
```bash
curl -L https://git.io/gdev-installer  | sh -
```