module.exports = function(grunt) {

  grunt.loadNpmTasks('grunt-contrib');
  // Project configuration.
  grunt.initConfig({
    pkg: '<json:package.json>',
    meta: {
      banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
        '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
        '<%= pkg.homepage ? "* " + pkg.homepage + "\n" : "" %>' +
        '* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>;' +
        ' Licensed <%= _.pluck(pkg.licenses, "type").join(", ") %> */'
    },
    coffee: {
      compile: {
        files: {
         'lib/<%= pkg.name %>.js': 'lib/<%= pkg.name %>.coffee',
         'test/<%= pkg.name %>_test.js': 'test/<%= pkg.name %>_test.coffee'
        }
      }
    },
    concat: {
      dist: {
        src: [
          '<banner:meta.banner>',
//          '<file_strip_banner:lib/>'
          '<file_strip_banner:lib/<%= pkg.name %>.js>'
        ],
        dest: 'dist/<%= pkg.name %>.js'
      }
    },
    min: {
      dist: {
        src: ['<banner:meta.banner>', '<config:concat.dist.dest>'],
        dest: 'dist/<%= pkg.name %>.min.js'
      }
    },
    test: {
      files: ['test/**/*.js']
    },
    lint: {
      files: ['grunt.js', 'lib/**/*.js', 'test/**/*.js']
    },
    watch: {
      files: ['grunt.js', 'lib/*.coffee', 'test/*.coffee'],
      tasks: 'coffee concat lint test'
    },
    jshint: {
      options: {
        curly: true,
        eqeqeq: true,
        immed: true,
        latedef: true,
        newcap: true,
        noarg: true,
        sub: true,
        undef: true,
        boss: true,
        eqnull: true
      },
      globals: {
        exports: true,
        module: false,
        require: true,
        console: true,
        fs: true,
        path: true,
        __dirname: true
      }
    },
    uglify: {}
  });

  // Default task.
  grunt.registerTask('default', 'coffee lint test concat min');

};
