import express, { Application } from "express";

//* Express App
const app: Application = express();

//* Global Middlewares
app.use(express.json());

// GET /
app.get("/", (_req, res) => {
	// 200 Success response
	res.json({
		success: true,
		message: "Cold Greetings from Bengal CS!",
	});
});

export { app };
