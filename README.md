# Capacitor App Tracking Transparency plugin

# Available methods:

- `getStatus(): Promise<AppTrackingTransparencyStatus>`
- `requestPermission(): Promise<AppTrackingTransparencyStatus>`

# Usage example:

0. Do not forget to add `NSUserTrackingUsageDescription` to your `Info.plist` file

```xml
<key>NSUserTrackingUsageDescription</key>
<string>YOUR DESCRIPTION</string>
```

1. In your module (e.g. `app.module.ts`)

```ts
...
import { AppTrackingTransparency } from 'capacitor-app-tracking-transparency'

@NgModule({
	...
	providers: [
		...
		AppTrackingTransparency,
	],
})
export class AppModule {}

```

2. In your component or service (e.g. `permission.service.ts`)

```ts
...
import { AppTrackingTransparency, AppTrackingTransparencyStatus } from 'capacitor-app-tracking-transparency'

@Injectable()
export class PermissionService {
	constructor(private att: AppTrackingTransparency) {}

    async requestATT() {
		const status = await this.att.getStatus()
		if(status === AppTrackingTransparencyStatus.notDetermined) {
			const new_status = await this.att.requestPermission()
		}
	}
}

```

## BREAKING CHANGES in 3.x.x version

- Add support for Capacitor 5 and remove compatibility with Capacitor 3

## BREAKING CHANGES in 2.x.x version

- Status "unrequested" has been changed to status "notDetermined" to more closely match the native enum
  https://developer.apple.com/documentation/apptrackingtransparency/attrackingmanager/authorizationstatus

- Added full support for Capacitor 3 and removed compatibility with Capacitor 2
