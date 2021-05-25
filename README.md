# Capacitor App Tracking Transparency plugin

# Available methods:

- `isDebug()`

# Usage example:

1. In your module (e.g. `app.module.ts`)

```ts
...
import { DetectEnvironment } from 'capacitor-detect-environment'

@NgModule({
	...
	providers: [
		...
		DetectEnvironment,
	],
})
export class AppModule {}

```

2. In your component or service (e.g. `api.service.ts`)

```ts
...
import { DetectEnvironment } from 'capacitor-detect-environment'

@Injectable()
export class ApiService {
	constructor(private env: DetectEnvironment) {}

    async getApiHost() {
        const isDebug = await this.env.isDebug()
        if (isDebug) return 'https://dev.api.com'
        else return 'https://api.com'
    }
}

```
