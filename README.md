Homebrew Time Machine by mariobrostech

Instructions:
1) Download the ZIP file
2) Open Terminal and cd to the extracted folder
3) Run nano ./packages.txt to see and edit the list of applications the script will install
4) Once you have the scripts you want dialed in, backup your personal files and do a fresh install of macOS. Once you're at the desktop, open Terminal, cd to the script's folder, and run ./brew.sh
5) Enter your password, press enter to install Xcode's command line tools, and grab a coffee

If you want to see the contents, of the script itself (you don't need to, it's just if you want an idea of what's happening behind-the-scenes), do the following:
1) Open Terminal and cd to the script's folder
2) Run nano ./brew.sh
3) Look around, and make any changes you'd like (one useful change would be to add a line with the mackup restore if you want to have the script restore your app preferences automatically)