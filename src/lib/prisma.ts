import "dotenv/config";
import { env } from "prisma/config";
import { PrismaClient } from "../../generated/prisma/client.ts";
import { PrismaPg } from "@prisma/adapter-pg";

//* DB Connection String
const connectionString = env("DB_URL");

//* Postgres Adapter
const adapter = new PrismaPg({ connectionString });

//* Prisma Client
const prisma = new PrismaClient({ adapter });

export { prisma };
