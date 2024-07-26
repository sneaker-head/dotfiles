# russell bash_profile
#

# silence zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# macos does NOT follow convention
if [ -r ~/.bashrc ]; then
	source ~/.bashrc
fi
