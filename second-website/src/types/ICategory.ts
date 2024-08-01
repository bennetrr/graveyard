export enum CategoryColors {
  SLATE = 'bg-slate-400 text-slate-900',
  GRAY = 'bg-gray-400 text-gray-900',
  ZINC = 'bg-zinc-400 text-zinc-900',
  NEUTRAL = 'bg-neutral-400 text-neutral-900',
  STONE = 'bg-stone-400 text-stone-900',
  RED = 'bg-red-400 text-red-900',
  ORANGE = 'bg-orange-400 text-orange-900',
  AMBER = 'bg-amber-400 text-amber-900',
  YELLOW = 'bg-yellow-400 text-yellow-900',
  LIME = 'bg-lime-400 text-lime-900',
  GREEN = 'bg-green-400 text-green-900',
  EMERALD = 'bg-emerald-400 text-emerald-900',
  TEAL = 'bg-teal-400 text-teal-900',
  CYAN = 'bg-cyan-400 text-cyan-900',
  SKY = 'bg-sky-400 text-sky-900',
  BLUE = 'bg-blue-400 text-blue-900',
  INDIGO = 'bg-indigo-400 text-indigo-900',
  VIOLET = 'bg-violet-400 text-violet-900',
  PURPLE = 'bg-purple-400 text-purple-900',
  FUCHSIA = 'bg-fuchsia-400 text-fuchsia-900',
  PINK = 'bg-pink-400 text-pink-900',
  ROSE = 'bg-rose-400 text-rose-900',
}

export const Categories = Object.freeze({
  ASTRO: {name: 'Astro', color: CategoryColors.INDIGO},
  ASTRO_STARLIGHT: {name: 'Astro Starlight', color: CategoryColors.STONE},
  GREENFOOT: {name: 'Greenfoot', color: CategoryColors.LIME},
  JAVA: {name: 'Java', color: CategoryColors.AMBER},
  JAVASCRIPT: {name: 'JavaScript', color: CategoryColors.YELLOW},
  LANG_GER: {name: 'Language: German', color: CategoryColors.SLATE},
  PYTHON: {name: 'Python', color: CategoryColors.BLUE},
  REACT: {name: 'React', color: CategoryColors.SKY},
  SCHOOL: {name: 'School Project', color: CategoryColors.SLATE},
  SVELTE_KIT: {name: 'SvelteKit', color: CategoryColors.ORANGE},
  NEXT_JS: {name: 'Next.js', color: CategoryColors.NEUTRAL},
  MINECRAFT: {name: 'Minecraft', color: CategoryColors.GREEN},
  BUKKIT: {name: 'Bukkit / Paper', color: CategoryColors.GREEN},
  CSHARP: {name: 'C#', color: CategoryColors.VIOLET}
}) satisfies {[key: string]: ICategory};

export type ICategory = {
  name: string;
  color: CategoryColors;
}
