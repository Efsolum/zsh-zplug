
function_dir=$(dirname $_)
fpath=($function_dir $fpath)

# Autoload all functions in this directory
for func in $(ls $function_dir) ;
do
		[[ $func == 'index.zsh' ]] && continue
    autoload -U $func
done
