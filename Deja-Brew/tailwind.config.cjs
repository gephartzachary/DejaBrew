/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {
    extend: {
      dropshadow: {
        'mkDark': [
          '0 4px 3px rgb(0 0 0 / 0.25)',
          '0 4px 3px rgb(0 0 0 / .15)'
        ]
      },
      fontFamily: {
        'sans-serif': ['ui-sans-serif', '"Open Sans"', 'Arial']
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms')
  ],
}
