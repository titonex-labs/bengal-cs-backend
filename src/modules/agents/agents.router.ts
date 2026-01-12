import { Router } from "express";
import { agentsController } from "./agents.controller.ts";

//* Router
const router = Router();

// POST /
router.post("/", agentsController.createAgent);

export { router as agentsRouter };
