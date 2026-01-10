-- CreateEnum
CREATE TYPE "SeasonStatus" AS ENUM ('UPCOMING', 'ACTIVE', 'ENDED');

-- CreateEnum
CREATE TYPE "BookingStatus" AS ENUM ('PENDING', 'CONFIRMED', 'STORED', 'RELEASED', 'COMPLETED', 'CANCELED');

-- CreateEnum
CREATE TYPE "StorageReceiptStatus" AS ENUM ('RECEIVED', 'STORED', 'RELEASED');

-- CreateTable
CREATE TABLE "farmer" (
    "id" UUID NOT NULL,
    "agentId" UUID,
    "name" VARCHAR(50) NOT NULL,
    "fatherName" VARCHAR(50) NOT NULL,
    "phone" VARCHAR(15) NOT NULL,
    "address" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "farmer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "agent" (
    "id" UUID NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "phone" VARCHAR(15) NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "agent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "season" (
    "id" UUID NOT NULL,
    "year" VARCHAR(9) NOT NULL,
    "status" "SeasonStatus" NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "season_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "chamber_lot" (
    "id" UUID NOT NULL,
    "floorNo" SMALLINT NOT NULL,
    "chamberNo" SMALLINT NOT NULL,
    "lotNo" SMALLINT NOT NULL,
    "capacitySacks" SMALLINT NOT NULL,
    "capacityWeight" DECIMAL(8,2) NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "chamber_lot_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Booking" (
    "id" UUID NOT NULL,
    "bookingNo" BIGSERIAL NOT NULL,
    "seasonId" UUID NOT NULL,
    "agentId" UUID NOT NULL,
    "farmerId" UUID NOT NULL,
    "bookedSacks" INTEGER NOT NULL,
    "advanceAmount" INTEGER NOT NULL,
    "note" VARCHAR(150),
    "status" "BookingStatus" NOT NULL DEFAULT 'PENDING',
    "bookedAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "Booking_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StorageReceipt" (
    "id" UUID NOT NULL,
    "storageReceiptNo" BIGSERIAL NOT NULL,
    "bookingId" UUID NOT NULL,
    "chamberNo" SMALLINT NOT NULL,
    "totalSacks" INTEGER NOT NULL,
    "totalWeight" DECIMAL(8,2) NOT NULL,
    "status" "StorageReceiptStatus" NOT NULL DEFAULT 'RECEIVED',
    "receivedAt" TIMESTAMPTZ NOT NULL,
    "storedAt" TIMESTAMPTZ,
    "releasedAt" TIMESTAMPTZ,
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "StorageReceipt_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "position" (
    "id" UUID NOT NULL,
    "bookingId" UUID NOT NULL,
    "storageReceiptId" UUID NOT NULL,
    "chamberNo" SMALLINT NOT NULL,
    "loadingPosition" VARCHAR(15) NOT NULL,
    "sacks" INTEGER NOT NULL,
    "note" VARCHAR(150),
    "createdAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "position_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "position_shift" (
    "id" UUID NOT NULL,
    "positionId" UUID NOT NULL,
    "shiftNo" SMALLINT NOT NULL,
    "note" VARCHAR(150),
    "shiftedAt" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "position_shift_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "farmer_phone_key" ON "farmer"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "agent_phone_key" ON "agent"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "season_year_key" ON "season"("year");

-- CreateIndex
CREATE UNIQUE INDEX "StorageReceipt_bookingId_key" ON "StorageReceipt"("bookingId");

-- CreateIndex
CREATE UNIQUE INDEX "position_bookingId_key" ON "position"("bookingId");

-- CreateIndex
CREATE UNIQUE INDEX "position_storageReceiptId_key" ON "position"("storageReceiptId");
