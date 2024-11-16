/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./internal/**/*.{templ,html, txt}"],
  theme: {
    fontFamily: {
      'heading': ['Quicksand', 'sans-serif', 'modern'],
      'flow': ['Quicksand', 'sans-serif'],
  },
    extend: {},
  },
  plugins: [],
}

