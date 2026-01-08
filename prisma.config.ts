import "dotenv/config";
import { defineConfig, env } from "prisma/config";

//* Prisma Config

export default defineConfig({
	schema: "prisma/schema.prisma",
	migrations: {
		path: "prisma/migrations",
	},
	datasource: {
		url: env("DB_URL"),
	},
});
