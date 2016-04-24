package_dir=$(dirname $_)

# zplug directory, for storing zsh dpendencies
export ZPLUG_HOME=$package_dir/zplug
export USER_PACKAGE_VERBOSE=${USER_PACKAGE_VERBOSE:-false}

[[ -d $ZPLUG_HOME ]] || \
		{print 'Installing Zplug'
		 git clone https://github.com/b4b4r07/zplug $ZPLUG_HOME
		 zplug update --self}

source $ZPLUG_HOME/zplug
source $package_dir/themes.zsh
source $package_dir/Zplug.zsh
source $package_dir/zfunctions/index.zsh

[[ $USER_PACKAGE_VERBOSE == true ]] && \
		{print "Zplug version: $(zplug version)"
		 print "Zplug package directory: $package_dir"}

# update symlinks to relative paths
# if [[ -d $ZDOTDIR/zplug/bin/ ]]; then
# 		symlinks -dc $ZDOTDIR/{zplug/bin/,zplug} | \
# 				sed 's\^\symlinks: \' &>> $ZCONFIG_LOG
# fi
