import express, { Application } from "express";
import { chamberLotsRouter } from "./modules/chamber-lots/chamber-lots.router.ts";
import { farmersRouter } from "./modules/farmers/farmers.router.ts";
import { agentsRouter } from "./modules/agents/agents.router.ts";

//* Express App
const app: Application = express();

//* Global Middlewares
app.use(express.json());

//* Modules
app.use(`${process.env.API_BASE}/farmers`, farmersRouter);
app.use(`${process.env.API_BASE}/agents`, agentsRouter);
app.use(`${process.env.API_BASE}/chamber-lots`, chamberLotsRouter);

// GET /
app.get("/", (_req, res) => {
	// 200 Success response
	res.json({
		success: true,
		message: "Cold Greetings from Bengal CS!",
	});
});

export { app };
