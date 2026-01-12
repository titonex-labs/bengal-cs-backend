import { Request, Response } from "express";
import { Agent } from "../../../generated/prisma/client.ts";
import { agentsService } from "./agents.service.ts";

//* Create an Agent
const createAgent = async (req: Request, res: Response) => {
	try {
		// Nuts and Bolts
		const data: Agent = await agentsService.createAgent(req.body);
		// 201 success response
		return res.status(201).json({
			success: true,
			message: "Agent profile created successfully",
			data,
		});
	} catch (err: any) {
		// 500 error response
		return res.status(500).json({
			success: false,
			message: "Unable to create agent profile",
			error: {
				code: err.code || undefined,
				message: err.message || undefined,
				details: err,
			},
		});
	}
};

const agentsController = { createAgent };

export { agentsController };
