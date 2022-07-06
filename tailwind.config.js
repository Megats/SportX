module.exports = {
  content: [
    './app/**/*.{html,js,erb,slim}',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  
  plugins: [require("daisyui")],

  // daisyUI config (optional)
  daisyui: {
  styled: true,
  themes: true,
  base: true,
  utils: true,
  logs: true,
  rtl: false,
  prefix: "",
  darkTheme: "cupcake",
  },

}
