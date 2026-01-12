import { Request, Response } from "express";
import { ChamberLot } from "../../../generated/prisma/client.ts";
import { chamberLotsService } from "./chamber-lots.service.ts";
import { success } from "better-auth";

//* Create a Chamber Lot
const createChamberLot = async (req: Request, res: Response) => {
	try {
		// Nuts and Bolts
		const data: ChamberLot = await chamberLotsService.createChamberLot(req.body);
		// 201 success response
		return res.status(201).json({
			success: true,
			message: "Chamber Lot created successfully",
			data,
		});
	} catch (err: any) {
		// 500 error response
		return res.status(500).json({
			success: false,
			message: "Unable to create chamber lot",
			error: {
				code: err.code || undefined,
				message: err.message || undefined,
				details: err,
			},
		});
	}
};

//* Get Chamber Lots
const getChamberLots = async (req: Request, res: Response) => {
	try {
		// Nuts and Bolts
		const data: ChamberLot[] = await chamberLotsService.getChamberLots();
		// 200 success response
		return res.status(200).json({
			success: true,
			message: "Chamber Lots retrieved successfully",
			data,
		});
	} catch (err: any) {
		// 500 error response
		return res.status(500).json({
			success: false,
			message: "Unable to retrieve chamber lots",
			error: {
				code: err.code || undefined,
				message: err.message || undefined,
				details: err,
			},
		});
	}
};

const chamberLotsController = { createChamberLot, getChamberLots };

export { chamberLotsController };
