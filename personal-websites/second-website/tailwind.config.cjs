/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      typography: theme => ({
        DEFAULT: {
          css: {
            code: {
              backgroundColor: theme('colors.stone.800'),
              padding: '0.2rem 0.25rem',
              fontWeight: '400',
              fontFamily: '"JetBrains Mono Variable", monospace',
              'border-radius': '0.25rem'
            },
            'code::before': {
              content: '""'
            },
            'code::after': {
              content: '""'
            },
            pre: {
              fontFamily: '"JetBrains Mono Variable", monospace',
              backgroundColor: `${theme('colors.stone.800')} !important`
            }
          }
        }
      }),

    }
  },
  plugins: [
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography')
  ]
};
