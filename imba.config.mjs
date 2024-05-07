import { build } from "vite";

export default {
	bundler: "vite",
	client: {
		build: {
			sourcemap: "true"
		},
		// Any vite config can be put in client object in order to configure the bundling.
		// It will be merged with the default config bundled with imba
		plugins: [], // same for plugins
	},
	// server: {}
}