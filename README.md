## Yojimbo.fr - Update Jan. 2014

### Technologies used

#### HTML 5 / Jade

The markup language is obviously HTML 5. I used some semantic elements to better define the structure (`<section>`, `<article>`, `<aside>` ...). 
On the content side, I had a list of project to display. Instead of having a server and a database running, I choose to put everything in a JSON file, and 
generate the HTML with the help of Jade.

**Ressources used**
[jade-lang.com](http://jade-lang.com/)
[The Truth About Multiple H1 Tags in the HTML5 Era](http://dev.tutsplus.com/articles/the-truth-about-multiple-h1-tags-in-the-html5-era--webdesign-16824)
[Static JSON and Jade with Grunt](http://stackoverflow.com/questions/16267122/how-to-include-a-static-json-file-for-compilation-with-jade-and-grunt)


#### SASS / CSS 3

All the CSS is compiled from `.scss` files. I used a recent version of Sass in order to enable sourcemaps, and be able to debug directly the sass inside the Chrome DevTools.
Compilation is made with Grunt.

**Ressources used**
[Chrome DevTools Revolution 2013 - Sass Source maps / Workspaces](http://www.html5rocks.com/en/tutorials/developertools/revolutions2013/)