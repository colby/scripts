#!/bin/bash
# check if vimrc is already there
#	back it up
# search github for vimrc
#	if its legit/passes
#		copy to local vimrc
# reload vim or save for next run

vimrc=$HOME/.vimrc
if [ -f $vimrc ];then
	[ ! -f $vimrc"_orig" ] && cp $vimrc $vimrc"_orig"
fi

function is_even() {
# TODO: randomly pick between sorted options
# sort by stars, forks, or updated
if [ ! -z "$#" ]; then
	value=$(expr $1 % 2)
	(( $value == 0 )) && return 1 || return 0
fi
}

cache=$HOME/.vimrc_cache
type="&sort=updated&order=desc"	
if [ ! -f $cache ] || [ $(find $HOME -name '.vimrc_cache' -mtime +60s -maxdepth 1) ]; then
	curl "https://api.github.com/search/repositories?q=dotfile+language:bash"$type > $cache
fi	

cat $cache | grep "clone_url" | grep "dotfiles.git" | cut -d'"' -f4
