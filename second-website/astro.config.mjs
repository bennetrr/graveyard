import { defineConfig } from 'astro/config';
import tailwind from "@astrojs/tailwind";

import sitemap from "@astrojs/sitemap";

// https://astro.build/config
export default defineConfig({
  site: 'https://bennetr.me',
  integrations: [
    tailwind(),
    sitemap({
      changefreq: 'monthly',
      lastmod: Date.now(),
    })
  ],
  markdown: {
    remarkPlugins: ['remark-gfm', 'remark-smartypants', 'remark-math'],
    rehypePlugins: ['rehype-mathjax']
  }
});
