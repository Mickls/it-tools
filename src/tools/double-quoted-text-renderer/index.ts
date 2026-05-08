import { Quote } from '@vicons/tabler';
import { defineTool } from '../tool';

export const tool = defineTool({
  name: 'Double-quoted text renderer',
  path: '/double-quoted-text-renderer',
  description: 'Render the content inside a double-quoted string',
  keywords: ['quote', 'double', 'string', 'render', 'unescape'],
  component: () => import('./double-quoted-text-renderer.vue'),
  icon: Quote,
  createdAt: new Date('2025-08-25'),
  category: 'Text',
});
