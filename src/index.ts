import { registerPlugin } from '@capacitor/core';

import type { LocationCheckerPlugin } from './definitions';

const LocationChecker = registerPlugin<LocationCheckerPlugin>('LocationChecker', {
  web: () => import('./web').then((m) => new m.LocationCheckerWeb()),
});

export * from './definitions';
export { LocationChecker };
