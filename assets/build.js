const path  = require('path');
const esbuild = require('esbuild');
const { sassPlugin } = require('esbuild-sass-plugin');

const args = process.argv.slice(2);
const watch = args.includes('--watch');
const deploy = args.includes('--deploy');

const loader = {};

const plugins = [sassPlugin()];

// Define esbuild options
let opts = {
  entryPoints: ["js/app.js"],
  bundle: true,
  logLevel: "info",
  target: "es2017",
  outdir: "../priv/static/assets",
  external: ["*.css", "/fonts/*", "/images/*"],
  nodePaths: ["../deps"],
  loader: loader,
  plugins: plugins,
};

if (deploy) {
  opts = {...opts, minify: true};
}

if (watch) {
  opts = {...opts, sourcemap: "inline"};

  esbuild
    .context(opts)
    .then((ctx) => {
      ctx.watch();
    })
    .catch((_error) => {
      process.exit(1);
    });
} else {
  esbuild.build(opts);
}
