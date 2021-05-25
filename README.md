# Capacitor App Tracking Transparency plugin

# Available methods:

- `getStatus()`
- `requestPermission()`

# Usage example:

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
		if(status === AppTrackingTransparencyStatus.unrequested) {
			const new_status = await this.att.requestPermission()
		}
	}
}

```
