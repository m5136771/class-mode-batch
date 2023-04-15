#!/bin/bash -e
clear

countdown() {
    for i in 3 2 1; do
        echo "$i..."
        sleep 1s
    done
}

# Step 1: Install or Update Homebrew
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Homebrew..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Updating Homebrew..."
    brew update
fi

# Step 2: Install Git
echo "Downloading Git..."
brew install git

# Step 3: Install VS Code
echo "Downloading VS Code..."
brew install --cask visual-studio-code

# Step 4: Set up Desktop folder for coding
echo "Creating new folder on Desktop for your coding projects..."
sleep 1s
echo "What should it be called? (one word only or spaced_with_underscores)"
read folderName

# Ensure folderName doesn't contain illegal characters
folderName="${folderName//[^a-zA-Z0-9_]/_}"
mkdir "$HOME/Desktop/$folderName"
echo "."
sleep 1s
echo "."
sleep 1s
echo "."
sleep 1s
echo "Done! Folder $folderName created!"
sleep 1s
echo "Now I'm taking you to GitHub.com to create an account. When you're done, come back here."
sleep 1s

# Step 5: Create account on GitHub
echo "Opening GitHub.com in:"
countdown
open https://github.com/join

# Step 6: Wait for the user to return
echo "Press ENTER when you have created your GitHub account."
read -s

# Step 7: Configure Git and create username repo folder
echo "What is your GitHub username?"
read username
echo "Your username is $username"
git config --global user.name $username

cd "$HOME/Desktop/$folderName"
mkdir $username.github.io
cd $username.github.io

# Step 8: Clone a starter template for GitHub Pages
echo "Cloning a starter template for your GitHub Pages repository..."
git clone https://github.com/pages-themes/minimal.git
mv minimal/* .
rm -rf minimal

# Step 9: Configure Git global identity
echo "What email address did you use for your GitHub account?"
read email
echo "Your email is $email"
git config --global user.email $email

# Step 10: Print summary of the setup process
echo "Homebrew installed."
echo "Git installed."
echo "VS Code installed."
echo "Project folder created on Desktop."
echo "GitHub account ready."
echo "Git configured as:"
git config --global --list
echo " "
echo "Mr. DiPaolo wins."

# Step 11: Open Visual Studio Code
echo "Opening Visual Studio Code in:"
countdown
open -a "Visual Studio Code" .
