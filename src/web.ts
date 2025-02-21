import { WebPlugin } from '@capacitor/core';

import type { LocationCheckerPlugin } from './definitions';

export class LocationCheckerWeb extends WebPlugin implements LocationCheckerPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
