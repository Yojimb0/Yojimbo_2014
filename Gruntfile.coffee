module.exports = (grunt) ->
	
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-jshint'
	grunt.loadNpmTasks 'grunt-contrib-sass'
	grunt.loadNpmTasks 'grunt-contrib-connect'
	grunt.loadNpmTasks 'grunt-open'
	grunt.loadNpmTasks 'grunt-svgmin'
	grunt.loadNpmTasks 'grunt-autoprefixer'
	grunt.loadNpmTasks 'grunt-contrib-jade'

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
				# jshintrc: '.jshintrc'
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
				dest: 'dev/css/main_prefixed.css'

		jade:
			html:
				src: './dev/index.jade'
				dest: './dev/index.html'
				options:
					client: false
					pretty: true
					data: grunt.file.readJSON("data.json")





	grunt.registerTask 'default', ['jshint']

	grunt.registerTask 'server', ['connect:dev', 'jade', 'sass', 'autoprefixer', 'jshint', 'svgmin', 'open:dev', 'watch']










