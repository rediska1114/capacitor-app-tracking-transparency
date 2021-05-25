declare module '@capacitor/core' {
  interface PluginRegistry {
    CapacitorAppTrackingTransparency: CapacitorAppTrackingTransparencyPlugin;
  }
}

export enum AppTrackingTransparencyStatus {
  unrequested = 'unrequested',
  restricted = 'restricted',
  denied = 'denied',
  authorized = 'authorized',
}

export interface AppTrackingTransparencyResponse {
  value: AppTrackingTransparencyStatus;
}

export interface CapacitorAppTrackingTransparencyPlugin {
  getStatus(): Promise<AppTrackingTransparencyResponse>;
  requestPermission(): Promise<AppTrackingTransparencyResponse>;
}
