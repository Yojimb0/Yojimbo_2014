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
		
		open:
			dev:
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
				src: 'dev/css/main.css'
				dest: 'dev/css/main.css'

		jade:
			html:
				src: './dev/index.jade'
				dest: './dev/index.html'
				options:
					client: false
					pretty: true
					data: grunt.file.readJSON("data.json")

		staticinline:
			dev:
				files:
					'dist/index.html': 'dist/index.html'

		clean: ["dist/*"]

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
						'js/main.js',
						'css/main.css',
						'css/visitor1/ttf',
						'images/*.{gif,webp,png,jpg,svg}',
						'cv/'
					]
				}]

		uglify:
			dist:
				files:
					'dist/js/main.js': ['dist/js/main.js']








	grunt.registerTask 'default', ['jshint']

	grunt.registerTask 'server', [
		'connect:dev',
		'jade',
		'sass', 'autoprefixer',
		'jshint',
		'svgmin',
		'open:dev', 'watch'
	]

	grunt.registerTask 'build', [
		'clean',
		'jade',
		'sass', 'autoprefixer',
		'jshint', 
		'svgmin',
		'copy',
		'uglify', 'staticinline',
		'imagemin',
	]










