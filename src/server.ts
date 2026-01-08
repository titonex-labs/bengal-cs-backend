import { app } from "./app.ts";

//* Port
const PORT = process.env.PORT || 8080;

async function main() {
	try {
		// Listen to server
		app.listen(PORT, () => {
			console.log(`[SUCCESS] Bengal CS server is operating on localhost:${PORT}`);
		});
	} catch (err) {
		// Log error
		console.error("[ERROR] A server error:", err);
	}
}

main();
