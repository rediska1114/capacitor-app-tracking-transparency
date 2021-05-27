import { Plugins } from '@capacitor/core';
import {
  AppTrackingTransparencyStatus,
  AppTrackingTransparencyResponse,
  CapacitorAppTrackingTransparencyPlugin,
} from './definitions';

const ATTPlugin =
  Plugins.CapacitorAppTrackingTransparency as CapacitorAppTrackingTransparencyPlugin;

function wrapMethod(
  f: () => Promise<AppTrackingTransparencyResponse>,
): () => Promise<AppTrackingTransparencyStatus> {
  return () => f().then(v => v.value);
}

type IAppTrackingTransparency = Record<
  keyof CapacitorAppTrackingTransparencyPlugin,
  () => Promise<AppTrackingTransparencyStatus>
>;

export class AppTrackingTransparency implements IAppTrackingTransparency {
  getStatus = wrapMethod(ATTPlugin.getStatus);
  requestPermission = wrapMethod(ATTPlugin.requestPermission);
}
