#!/bin/bash
clear

# Install or Update Homebrew
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Homebrew..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Updating Homebrew..."
    brew update
fi

# Install Git
echo "Downloading Git..."
brew install git

# Install VS Code
echo "Downloading VS Code..."
brew install --cask visual-studio-code


# Set up Desktop folder for coding
echo "Creating new folder on Desktop for your coding projects..."
sleep 1s
echo "What should it be called? (one word only or spaced_with_underscores)"
read folderName
mkdir $folderName
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

# Create account on GitHub
echo "Opening GitHub.com in 3..."
sleep 1s
echo "2..."
sleep 1s
echo "1..."
sleep 1s
open https://github.com/join

# Configure Git and create username repo folder
echo "What is your GitHub username?"
read username
echo "Your username is $username"
git config --global user.name $username

cd $folderName
mkdir $username.github.io

# Configure Git global identity
echo "What email address did you use for your GitHub account?"
read email
echo "Your email is $email"
git config --global user.email $email

echo "Homebrew installed."
echo "Git installed."
echo "VS Code installed."
echo "Project folder created on Desktop."
echo "GitHub account ready."
echo "Git configured as:"
git config --global --list
echo " "
echo "Mr. DiPaolo wins."




