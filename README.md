## Yojimbo.fr - Update Jan. 2014

Hi there ! Welcome here, take a seat. You're on the repository where my website sources are stored. I just finished my portfolio redesign, and I wanted to speak about it, and spend a bit of time to explain what choices I made, and why.

### HTML 5 / Jade

The markup language is obviously HTML 5. I used some semantic elements to better define the structure (`<section>`, `<article>`, `<aside>` ...).  
On the content side, I had a list of project to display. Instead of having a server and a database running, I choose to put everything in a JSON file, and 
generate the HTML with the help of Jade.

**Ressources**
> * [jade-lang.com](http://jade-lang.com/)
* [Static JSON and Jade with Grunt](http://stackoverflow.com/questions/16267122/how-to-include-a-static-json-file-for-compilation-with-jade-and-grunt)
* [The Truth About Multiple H1 Tags in the HTML5 Era](http://dev.tutsplus.com/articles/the-truth-about-multiple-h1-tags-in-the-html5-era--webdesign-16824)


---
### SASS / CSS 3

All the CSS is compiled from `.scss` files. I used a recent version of Sass in order to enable sourcemaps, and be able to debug directly the sass inside the Chrome DevTools.
Compilation is made with Grunt.

**Ressources**
> * [Chrome DevTools Revolution 2013 - Sass Source maps / Workspaces](http://www.html5rocks.com/en/tutorials/developertools/revolutions2013/)

---
### Javascript
I didn't want to put a lot of Javascript. Majority of the animations are made with CSS3 (more details below). I just needed a bit of UI interactions : expanding `<aside>` on small screens, managing scrollable areas (more details below).  
I could have get rid of jQuery, it will probably be the next evolution of the website.  
I tried to follow good practices, like caching my jQuery selectors, avoid anonymous function …  
My Javascript file is very small. In a way that it's more interesting to inline it inside the main HTML file, rather than force an extra request.

**Ressources**
> * [Avoiding anonymous functions](http://toddmotto.com/avoiding-anonymous-javascript-functions/)
* [Google Pagspeed - Inlining Javascript](https://developers.google.com/speed/pagespeed/module/filter-js-inline?hl=fr)





---
### Grunt
My gruntfile is in coffeescript, in order to avoid the huge number of curly brackets. I'm using a list of common plugins, like JSHint, Watch, open, autoprefixer … And some less common plugins, like Staticinline and SVGmin.


---
### Responsivity
The website has only one breakpoint, at 855 pixels. Switching from a "desktop" view with both side panels shown, to a "small screen" view, where the side panels are pushed aside.  
I tried using some modern units like VH to size some areas, but a bug in webkit prevent the dimensions of the areas to refresh when resizing the browser. Next time !  
I used a trick to bind/unbind the click event used to show/hide the 2 `<aside>`, taht consists of getting the responsive state in javascript, with the help of a div, and media-queries CSS.

**Ressources**
> * [CSSTricks - Viewport sized typography](http://css-tricks.com/viewport-sized-typography/)
> * [Get the responsive state in Javascript](http://stackoverflow.com/a/10364620)

---
### Popups for projects

**Ressources**
> * [Modal windows effects](http://tympanus.net/codrops/2013/06/25/nifty-modal-window-effects/)


---
### SVG
I wanted to have my avatar as SVG in the center area of the site, to simplify the handling of display on high-density screens.
I also found some good social icons, that were made with Sketch, I modified them to fit the theme of the site.

**Ressources**
> * [Animated line drawing with SVG](http://jakearchibald.com/2013/animated-line-drawing-svg/)
* [Social icons I used](http://tinktank.in/free-flat-social-icons/)

---
### Softwares

This project have been done on a Mac. I used [SublimeText 2] for code editing. For design purpose, I love to use [Sketch]

[SublimeText 2]: http://www.sublimetext.com
[Sketch]: http://www.bohemiancoding.com/sketch/