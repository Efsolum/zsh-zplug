package_dir=$(dirname $_)

# zplug directory, for storing zsh dpendencies
export ZPLUG_HOME=$package_dir/zplug
export USER_PACKAGE_VERBOSE=${USER_PACKAGE_VERBOSE:-false}
export USER_THEMES_ENABLED=${USER_THEMES_ENABLED:-false}

# Disable ohmyzsh auto update feature.
export DISABLE_AUTO_UPDATE="true"

if [[ ! -d $ZPLUG_HOME ]]; then
		print 'Installing Zplug'
		git clone https://github.com/zplug/zplug $ZPLUG_HOME
		source $ZPLUG_HOME/init.zsh && zplug update --self
fi

source $ZPLUG_HOME/init.zsh
[[ $USER_THEMES_ENABLED == true ]] && source $package_dir/themes.zsh
source $package_dir/Zplug.zsh
source $package_dir/zfunctions/index.zsh

[[ $USER_PACKAGE_VERBOSE == true ]] && \
		{print "Zplug version: $(zplug --version)"
		 print "Zplug package directory: $package_dir"}

# update symlinks to relative paths
if [[ -d $ZDOTDIR/zplug/bin/ && -x $(type symlinks) ]]; then
		symlinks -dc $ZDOTDIR/{zplug/bin/,zplug} | \
				sed 's\^\symlinks: \' &>> $ZCONFIG_LOG
fi
