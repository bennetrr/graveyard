import type {Page, MarkdownInstance} from 'astro';
import type {IImage} from '$/types/IImage.ts';

export interface IBlogPostFrontmatter {
  title: string;
  description: string;
  publicationDate: string;
  image?: IImage;
  hidden?: boolean;
}

export interface IBlogPostMarkdownInstance extends MarkdownInstance<IBlogPostFrontmatter> {}
export interface IBlogPostPage extends Page<IBlogPostMarkdownInstance> {}

export const comparePosts = (a: IBlogPostMarkdownInstance, b: IBlogPostMarkdownInstance) => (
      new Date(b.frontmatter.publicationDate).valueOf() - new Date(a.frontmatter.publicationDate).valueOf()
);
