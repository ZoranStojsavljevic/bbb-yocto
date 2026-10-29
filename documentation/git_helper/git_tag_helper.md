## Git tag helper

### Create a tag

#### 1 Create an annotated tag

In Git, to create an annotated tag. the command is: git tag -a .
The command is: git tag -a. An annotated tag stores metadata
such as the tagger's name, email, date, and a message.

	$ git tag -a yocto_x.y.z -m "yocto_x.y.z"

	- -a — creates an annotated tag
	- yocto_x.y.z — the tag name.
	- -m — provides the tag message.

#### 2 Tag a specific commit

	$ git tag -a yocto_x.y.z <commit-hash> -m "yocto_x.y.z"

If commit hash is to be ommited, Git tags the current HEAD commit.

#### 3 View the local tags and tags' details

	## List all local tags' names:
	$ git tag

	## For individual tag with details:
	$ git show yocto_x.y.z

	## To list all local tags with details:
	$ git tag -n99

	## To display full details for every local tag:
	for tag in $(git tag); do
		git show "$tag"
	done

#### 4 Push the tag to the remote repository

	## Push an individual tag:
	$ git push origin yocto_x.y.z

	## To push all local tags:
	$ git push origin --tags

### Delete a tag

#### 1 Delete a local tag

	$ git tag -d yocto_x.y.z

This deletes the local tag named yocto_x.y.z . It does not
delete the commit the tag points to.

#### 2 Delete a remote tag

	$ git push origin --delete yocto_x.y.z

This removes the tag from the remote repository, such as GitHub
or GitLab.

### List tags

#### 1 List local tags

	## List all local tags' names:
	$ git tag

	## List individual tag with details:
	$ git show yocto_x.y.z

	## List all local tags with details:
	$ git tag -n99

#### 2 List remote tags

	## List remote tags with details:
	$ git ls-remote --tags origin
