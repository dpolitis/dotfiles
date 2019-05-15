# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# Android 
export ANDROID_SDK_ROOT=${HOME}/workspace/android-sdk
PATH=$PATH:$ANDROID_SDK_ROOT/tools

PATH=$PATH:/opt/cxoffice/bin:$HOME/.local/bin:$HOME/bin

export PATH
