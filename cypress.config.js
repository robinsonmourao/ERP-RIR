import { defineConfig } from "cypress";

export default defineConfig({
	chromeWebSecurity: false,
	e2e: {
		setupNodeEvents(on, config) {
			// implement node event listeners here
		},
		// Não limpa o estado da tela inicial a cada it
		baseUrl: 'http://127.0.0.1:3000/',
		testIsolation: false
	},
});
