import { ChamberLot } from "../../../generated/prisma/client.ts";
import { prisma } from "../../lib/prisma.ts";

//* Insert Chamber Lot
const createChamberLot = async (data: Omit<ChamberLot, "id" | "createdAt" | "updatedAt">) => {
	// Insert into DB
	const result = await prisma.chamberLot.create({
		data,
	});
	// Return result
	return result;
};

//* Get Chamber Lots
const getChamberLots = async () => {
	// Retrieve all chamber lots from BD
	const result = await prisma.chamberLot.findMany();
	// Return result
	return result;
};

const chamberLotsService = { createChamberLot, getChamberLots };

export { chamberLotsService };
