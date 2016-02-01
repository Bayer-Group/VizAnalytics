gulp       = require 'gulp'
concat     = require 'gulp-concat'
gutil      = require 'gulp-util'
coffee     = require 'gulp-coffee'



gulp.task 'script', ()->
  gulp.src('./src/coffee/**/*.coffee')
    .pipe(concat 'app.coffee')
    .pipe(do coffee)
    .pipe(gulp.dest './lib/js')


gulp.task 'default', ['script']
