import svelte from 'rollup-plugin-svelte';
import commonjs from '@rollup/plugin-commonjs';
import resolve from '@rollup/plugin-node-resolve';
import { terser } from 'rollup-plugin-terser';
import sveltePreprocess from 'svelte-preprocess'; 
import typescript from '@rollup/plugin-typescript';

// it's production mode if MIX_ENV is "prod"
const production = process.env.MIX_ENV == "prod";

export default {
  // main entry point
  input: 'ts/main.ts',
  output: {
    sourcemap: true,
    format: 'iife',
    name: 'app',
    file: '../priv/static/js/app.js'
  },

  // define all the plugins we'd like to use
  plugins: [
    svelte({
      preprocess: sveltePreprocess(),
      compilerOptions: {
        dev: !production
      },
      
      emitCss: true,
      css: css => {
        css.write('../priv/static/css/app.css');
      }
       
    }),
    
    
    resolve({
      browser: true,
      dedupe: ['svelte']
    }),
    commonjs(),
    typescript({
      sourceMap: !production,
      inlineSources: !production
    }),
    
    production && terser()
  ],
  watch: {
    clearScreen: false
  }
};
