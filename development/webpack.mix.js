let mix = require("laravel-mix");


mix
  .js("src/js/app.js", "../static/js/")
  .sass("src/sass/app.scss", "../static/css/")
  .setPublicPath("../static/");

// API
//
// mix.js(src, output);
// mix.extract(vendorLibs);
// mix.sass(src, output);
// mix.postCss(src, output, [require('postcss-some-plugin')()]);
// mix.browserSync('my-site.test');
// mix.copy(from, to);
// mix.copyDirectory(fromDir, toDir);
// mix.minify(file);
// mix.sourceMaps(); // Enable sourcemaps
// mix.version(); // Enable versioning.
// mix.disableNotifications();
// mix.setPublicPath('path/to/public');
// mix.setResourceRoot('prefix/for/resource/locators');
// mix.options({
//   extractVueStyles: false, // Extract .vue component styling to file, rather than inline.
//   globalVueStyles: file, // Variables file to be imported in every component.
//   processCssUrls: true, // Process/optimize relative stylesheet url()'s. Set to false, if you don't want them touched.
//   purifyCss: false, // Remove unused CSS selectors.
//   uglify: {}, // Uglify-specific options. https://webpack.github.io/docs/list-of-plugins.html#uglifyjsplugin
//   postCss: [] // Post-CSS options: https://github.com/postcss/postcss/blob/master/docs/plugins.md
// });