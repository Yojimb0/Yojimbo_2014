## Website redesign marathon

This is a chronological description of my work for the redesign of my website. Explanation of the issues 
I encountered, and solutions that I found.

#### Saturday 12:00
* File structure
	* 2 subfolders (dev / prod)
	* Grunt and NPM config in the root
* Try to make a simple Grunt configuration inspired by some coffee snippets
	* With JSHinting, Sass compiling
	* With a localhost server and auto opening
	* With livereloading
* Encoutered some issues trying to get the server and livereload working
	* Was forgetting the connect task to start a server
	* Had to use "base" option for connect to go to the dev subfolder
	* grunt server -v for a verbose
* TODO : Check why livereload browser extension doesn't auto connect after grunt-open task

#### Saturday 13:30
* Grunt-sass options tweaks
	* style compact, sourcemap
* HTML structure