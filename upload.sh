#!/bin/bash

branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')

if [ "$branch" ==  "master" ]; then
	/opt/Godot/Godot --export-release "Web" Exports/Web/index.html
	zip -r Exports/web.zip Exports/Web/
	butler push Exports/web.zip jammin/taupattack:html5
	butler status jammin/taupattack:html5
else
	echo 'Commit on non-master branch: Running jshint on current changeset.'
fi

RESULT=$?

[ $RESULT -ne 0 ] && exit 1
exit 0

