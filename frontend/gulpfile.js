var gulp        = require('gulp'),
    sass        = require('gulp-sass'),
    browserSync = require('browser-sync'),
    ts          = require("gulp-typescript"),
    sourcemaps  = require('gulp-sourcemaps'),
    tsProject   = ts.createProject("tsconfig.json"),
    rename      = require('gulp-rename');

gulp.task('ts',function () {
    return tsProject.src()
        .pipe(ts(tsProject))
        .js.pipe(gulp.dest("app"));
});

gulp.task('copyHtml',function(){
    return gulp.src('dev/ts/**/*.html')
            .pipe(rename({dirname: ''}))
            .pipe(gulp.dest('app/html'));
});

gulp.task('sync', function() {
  gulp.src('')
    .pipe(fsync(['src/**', '!src/folder/**'], 'dest'));
});

gulp.task('copyCss',function(){
    return gulp.src('dev/ts/**/*.css')
            .pipe(rename({dirname: ''}))
            .pipe(gulp.dest('app/css'));
});

gulp.task('gulp-sass',function(){
    return gulp.src('assets/sass/**/*.+(scss|sass)')//путь к файлам
		.pipe(sass())//какой компонент(функция, хз как назвать еще) выполняем
		.pipe(gulp.dest('app/css'));//куда кладем полученные файлы
});

gulp.task('browser-sync',function(){
    browserSync({
        server:{
            baseDir: ''
        },
        notify:false
    });
});

//в скобках запускаем те таски которые должны запуститься до watch
gulp.task('watch', ['ts','copyHtml','copyCss'], function(){
        gulp.watch('dev/ts/**/*.ts',['ts']);//релодим при изменеии файлов ts
        gulp.watch('dev/ts/**/*.css',['copyCss']);
        gulp.watch('dev/ts/**/*.html',['copyHtml']);
});