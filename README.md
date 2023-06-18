# pUpdates
Library for Script Updates

## Checkout
```
git checkout https://github.com/Prusias-kol/pUpdates main
```

## How to setup
Run `pupdates help` for guidance on how to setup the file data. Make sure the scriptname u pick is consistently used.

Next, make sure the data/pUpdates/prusias_pUpdates_<your Script Name here>.txt file is added to your git repo

Your folder structure should look like this on github:  
- manifest.json - described below
- kolmafia/dependencies.txt - copied from this repo
- kolmafia/scripts/<your script here> - all of your script files go here
- kolmafia/data/<your data here> - all of your data files go here
- kolmafia/data/pUpdates/prusias_pUpdates_<your Script Name here>.txt - file you found above

manifest.json should be.   
```
{
	"root_directory": "kolmafia"
}
```

## How to add updates
Now that this is setup, refer to `pupdates help` for how to add new updates. Afterwards, make sure the update the data/prusias_pUpdates_<your Script Name here>.txt file on github.

## How to show the user updates
Wherever in your script you would like to ping the user with new updates (when they happen), do a cli execute call to `ploop check <scriptname>`. This will only print stuff if new updates are detected. Great way to educate users on new features!
