import { defineConfig } from "cypress";

export default defineConfig({
	chromeWebSecurity: false,
	e2e: {		
		baseUrl: 'http://127.0.0.1:3000/',
		// Não limpa o estado da tela inicial a cada it
		testIsolation: false
	},
});
