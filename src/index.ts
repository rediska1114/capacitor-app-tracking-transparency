import { registerPlugin } from '@capacitor/core';

import type {
  AppTrackingTransparencyPlugin,
  AppTrackingTransparencyResponse,
  AppTrackingTransparencyStatus,
} from './definitions';

const CapacitorATT = registerPlugin<AppTrackingTransparencyPlugin>(
  'AppTrackingTransparency',
);

function wrapMethod(
  f: () => Promise<AppTrackingTransparencyResponse>,
): () => Promise<AppTrackingTransparencyStatus> {
  return () => f().then(v => v.value);
}

export class AppTrackingTransparency {
  getStatus = wrapMethod(CapacitorATT.getStatus);
  requestPermission = wrapMethod(CapacitorATT.requestPermission);
}

export * from './definitions';
