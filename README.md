# arepo

Shell script to automatically create a path locally and push to GitHub.

Why does this exist?

I wanted to streamline the process of creating new projects. 

This is apart of my local development process, and this repository was created by the script.

You need to auth via the `gh` command.

You can do so by running the following:

`gh auth login`
`gh config --global user.email <youremailaddress>`
`gh config --global user.name <yourusername>`

Once this has been done, you can run the script by passing the path you wish to intialise as the first argument, like so:

`./arepo.sh <yourpath>`

This will only create the path if it does not exist.
This will initialise already existing paths as repositories.

This will automaticaly generate a README.md file.

Once the path & README.md file are steps are completed successfully, the script will automatically initialise the reporsitory, commit the README.md and then create the repository.

If there are any issues, plaese submit an issue for tracking.

This repository was initialized automatically.
Created: Fri Oct 31 09:39:24 PM AEST 2025
