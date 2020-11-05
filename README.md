# Homebrew Time Machine by [mariobrostech](https://github.com/mariobrostech)
### Huge thanks to [unilock](https://github.com/unilock) for helping me test and add functionality to the script!
### Install all of your apps in a simple, hackable script
- This script is primarily targeted to be used on macOS, but it should also work on Linux if you remove parts of the script referencing `brew cask` and `mas`.
- **You do not need to run this script with the sudo**, the script will automatically prompt you for your password every time you run it. This prevents you being asked for your password every time Homebrew installs a cask that needs to be symlinked into your Applications folder.
- **Please see the "Troubleshooting" section below to serve as answers/solutions for frequent questions and issues.**

## Instructions:
1. [Download the script here](https://github.com/rmc-team/homebrew-time-machine/archive/master.zip) and extract the zip archive.
2. Open Terminal, and `cd` to the extracted folder.
3. Run `nano ./packages.txt` to see and edit the list of applications the script will install. The script provides some default taps and packages to install, but these are entirely optional. I reccomend keeping [mackup](https://github.com/lra/mackup) to enable the backing up of application and system preferences and [mas](https://github.com/mas-cli/mas) to enable the installation of Mac App Store apps via the script.
4. Once you have you have modified `packages.txt` to your liking, run script using `./brew.sh`. I reccomend doing this in a virtual machine first in case any issues arise, but this is optional as well. Please note that the script expects being ran on a clean install of macOS or Linux, so if an existing Homebrew installation is detected, the script will simply update your existing packages, ignoring your packages.txt file. To get around this, you have a few options:
   1. Perform a clean installation of macOS. This option ensures that you won't face any issues with conflicting Homebrew packages or leftover files. However, this comes with the obvious disadvantage that you have to backup your data, log back in to everything, and re-license any paid software you may have. This is the ideal method, but it understandably isn't practical for most users.
   2. Uninstall Homebrew. You can find the commands you'll need to do this [here](https://github.com/Homebrew/install). Please note that this will remove all Homebrew software, including taps, packages, and casks. Make a backup before proceeding as this can be a destructive operation depending on how many applications you've installed with Homebrew.
   3. Modify the script to remove the parts checking for an existing Homebrew installation. I'm not going to write out how to do this because, frankly, if you don't know how to remove a loop from a bash script, you probably shouldn't be using this method to begin with. Use one of the other two solutions listed above instead.
5. Once the script executes, you will be prompted for your administrator password. Enter it, and when you are prompted to, press enter to confirm the installation of Xcode's command line tools. Now, relax and go grab a coffee!

If you want to see the contents, of the script itself (you don't need to, it's just if you want an idea of what's happening behind-the-scenes), do the following:
1. Open Terminal and `cd` to the extracted folder.
2. Run nano `./brew.sh`.
3. Look around, and make any changes you'd like (one useful change would be to add a line with the `mackup restore` command if you want to have the script import your app preferences automatically).

## Troubleshooting:
- Help! I'm getting an error saying "operation not permitted"! Don't fret; try running one of the two commands listed below:
   - `chmod +x ~/Downloads/homebrew-time-machine-master/brew.sh` (change the directory if you've moved the script out of your Downloads folder or renamed anything)
   - `xattr -d com.apple.quarantine ~/Downloads/homebrew-time-machine-master/brew.sh` (change the directory if you've moved the script out of your Downloads folder or renamed anything)
- I'm having a problem with something else! No worries; file an issue, and I'll try to help you find a solution :)
