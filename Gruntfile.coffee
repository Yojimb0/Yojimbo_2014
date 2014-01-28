module.exports = (grunt) ->
	
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-jshint'
	grunt.loadNpmTasks 'grunt-contrib-sass'
	grunt.loadNpmTasks 'grunt-contrib-connect'
	grunt.loadNpmTasks 'grunt-open'
	grunt.loadNpmTasks 'grunt-svgmin'
	grunt.loadNpmTasks 'grunt-autoprefixer'
	grunt.loadNpmTasks 'grunt-contrib-jade'
	grunt.loadNpmTasks 'grunt-static-inline'
	grunt.loadNpmTasks 'grunt-contrib-imagemin'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-uglify'


	grunt.initConfig
		connect:
			dev:
				options:
					port: 9000
					hostname: 'localhost'
					base: './dev'
			dist:
				options:
					port: 9000
					hostname: 'localhost'
					base: './dist'
		
		open:
			all:
				path: 'http://localhost:9000/'

		watch:
			options:
				livereload: true
			sass:
				files: 'dev/sass/**/*.scss'
				tasks: ['sass', 'autoprefixer']
			html:
				files: ['dev/*.html', '!dev/index.html']
				tasks: ['jade']
			javascript:
				files: 'dev/js/*.js'
				tasks: ['jshint']
			svg:
				files: 'dev/images/src/*.svg'
				tasks: ['svgmin']
			jade:
				files: ['dev/*.jade', 'data.json']
				tasks: ['jade']

		sass:
			dev:
				options:
					style: 'compact'
					sourcemap: true
				files:
					'dev/css/main.css': 'dev/sass/main.scss'
					'dev/css/error.css': 'dev/sass/error.scss'
			dist:
				options:
					style: 'compressed'
					sourcemap: false
				files:
					'dist/css/main.css': 'dev/sass/main.scss'
					'dist/css/error.css': 'dev/sass/error.scss'

		jshint:
			options:
				debug: true
				globals:
				    jQuery: true
				    debugger: true
			dev: 'dev/js/*.js'

		svgmin:
			dev:
				files: [{
					expand: true,
					cwd: 'dev/images/src',
					src: ['**/*.svg'],
					dest: 'dev/images/',
					ext: '.svg'
				}]

		autoprefixer:
			dev:
				options:
					map: true
				expand: true
				flatten: true
				src: 'dev/css/*.css'
				dest: 'dev/css/'
			dist:
				expand: true
				flatten: true
				src: 'dist/css/*.css'
				dest: 'dist/css/'

		jade:
			html:
				src: './dev/index.jade'
				dest: './dev/index.html'
				options:
					client: false
					pretty: true
					data: grunt.file.readJSON("data.json")

		staticinline:
			dist:
				options:
					basepath: 'dist/'
				files:
					'dist/index.html': 'dist/index.html'
					'dist/404.html': 'dist/404.html'
		clean:
			files: 
				expand:	true,
				cwd: 'dist/',
				src: [
					'**/*'
					'!sftp-config.json'
				]

		imagemin:
			dist:
				files: [{
					expand: true,
					cwd: 'dist/images/',
					src: ['**/*.{png,jpg,gif}'],
					dest: 'dist/images/'
				}]

		copy:
			main:
				files: [{
					expand: true,
					cwd: 'dev',
					dest: 'dist',
					src: [
						'index.html',
						'404.html',
						# 'js/main.js',
						#'css/main.css',
						'css/visitor1.ttf',
						'images/*.{gif,webp,png,jpg,svg}',
						'cv/*'
						'robots.txt'
						'humans.txt'
						'.htaccess'
						'apple-touch-icon-precomposed.png'
						'favicon.ico'
					]
				}]

		uglify:
			dist:
				files:
					'dist/js/main.js': ['dev/js/main.js']






	grunt.registerTask 'default', ['jshint']

	grunt.registerTask 'server', [
		'jshint',
		'sass', 'autoprefixer',
		'jade',
		'svgmin',
		'connect:dev', 'open:all', 'watch'
	]

	grunt.registerTask 'build', [
		'clean',
		'jshint', 'uglify',
		'sass:dist', 'autoprefixer:dist',
		'jade',
		'svgmin',
		'copy',
		'staticinline',
		'imagemin',
		'connect:dist', 'open:all', 'watch'
	]










