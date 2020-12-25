import 'phoenix_html';
import '../css/phoenix.css'
import '../css/global.css'
import App from './App.svelte';

const app = new App({
	target: document.body,
	props: {
		name: 'world'	}
});

export default app;
