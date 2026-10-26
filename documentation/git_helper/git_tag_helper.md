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

#### 3 View the tag details

	## For individual tags
	$ git show yocto_x.y.z

	## Display details for all local tags

	## To list all local tags:
	$ git tag -n99

	## To display full details for every local tag:
	for tag in $(git tag); do
		git show "$tag"
	done

#### 4 Push the tag to the remote repository

	$ git push origin yocto_x.y.z

	## To push all local tags:
	$ git push origin --tags

### Delete a tag

#### 1 Delete a local tag

	$ git tag -d yocto_x.y.z

This deletes the local tag named yocto_x.y.z . It does not
delete the commit the tag points to.

#### 2 Delete the remote tag

	$ git push origin --delete yocto_x.y.z

This removes the tag from the remote repository, such as GitHub
or GitLab.

### List tags

	## List local tags:
	$ git tag

	## List remote tags:
	$ git ls-remote --tags origin
