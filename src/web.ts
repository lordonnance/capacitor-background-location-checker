import { WebPlugin } from '@capacitor/core';

import type { LocationCheckerPlugin } from './definitions';

export class LocationCheckerWeb extends WebPlugin implements LocationCheckerPlugin {
  checkPermission(): Promise<{ status: string; }> {
    throw new Error('Method not implemented.');
  }
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
