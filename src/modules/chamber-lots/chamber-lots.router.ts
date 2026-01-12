import { Router } from "express";
import { chamberLotsController } from "./chamber-lots.controller.ts";

//* Router
const router = Router();

// POST /
router.post("/", chamberLotsController.createChamberLot);
// GET /
router.get("/", chamberLotsController.getChamberLots);

export { router as chamberLotsRouter };
