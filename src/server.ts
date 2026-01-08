import { app } from "./app.ts";
import { prisma } from "./lib/prisma.ts";

//* Port
const PORT = process.env.PORT || 8080;

async function main() {
	try {
		// Connect to DB
		await prisma.$connect();
		console.log("[SUCCESS] Connected to database");
		// Listen to server
		app.listen(PORT, () => {
			console.log(`[SUCCESS] Bengal CS server is operating on localhost:${PORT}`);
		});
	} catch (err) {
		// Log error
		console.error("[ERROR] A server error:", err);
		// Disconnect from DB
		await prisma.$disconnect();
		// Exit process
		process.exit(1);
	}
}

main();
