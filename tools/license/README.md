## How to check licenses in YOCTO (from styhead release)?

### 1. Enable license collection

Make sure to set the following in the local.conf:

	INHERIT += "license"
	LICENSE_CREATE_PACKAGE = "1"

### 2. BitBake Shows License Info

Inspect a recipe's declared license like this:

	$ bitbake -e <recipe-name> | grep ^LICENSE=

#### Example:

	$ bitbake -e openssl | grep ^LICENSE=
	### Output: LICENSE="OpenSSL"

### 3. Generate License Manifest Automatically

Yocto generates a license manifest per image, which is located
in the following directory after a successful build (in tmp/):

	tmp/deploy/licenses/<image-name>/license.manifest

It contains each package name, its declared license, and source
location.

The command issued:

	$ bitbake -k core-image-minimal -c populate_lic_deploy

There is also a bash helper to reformat license information from
license.manifest:

	$ ./license_report.sh
