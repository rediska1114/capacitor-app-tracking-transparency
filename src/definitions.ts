export enum AppTrackingTransparencyStatus {
  notDetermined = 'notDetermined',
  restricted = 'restricted',
  denied = 'denied',
  authorized = 'authorized',
}

export interface AppTrackingTransparencyResponse {
  value: AppTrackingTransparencyStatus;
}

export interface AppTrackingTransparencyPlugin {
  getStatus(): Promise<AppTrackingTransparencyResponse>;
  requestPermission(): Promise<AppTrackingTransparencyResponse>;
}
