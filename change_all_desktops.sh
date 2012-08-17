#! /bin/bash
#script to change all desktop backgrounds
# https://discussions.apple.com/message/18805586#18805586
# https://applehelpwriter.wordpress.com/category/mountain-lion/

echo -n "Change all desktop backgrounds to:"
read -e WLPR;

function change_wallpaper
{
	defaults write com.apple.desktop Background “{default = {ImageFilePath=’$WLPR’; };}”; killall Dock
}
change_wallpaper
