#!/bin/bash

branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')

if [ "$branch" ==  "master" ]; then
	/opt/Godot/Godot --export "HTML5" Exports/html5/index.html
	zip -r Exports/html5.zip Exports/html5/
	butler push Exports/html5.zip jammin/ludum-dare-52:html5
	butler status jammin/ludum-dare-52:html5
else
	echo 'Commit on non-master branch: Running jshint on current changeset.'
fi

RESULT=$?

[ $RESULT -ne 0 ] && exit 1
exit 0

