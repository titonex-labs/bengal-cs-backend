/*
  Warnings:

  - You are about to drop the `StorageReceipt` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "StorageReceipt";

-- CreateTable
CREATE TABLE "storage_receipt" (
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

    CONSTRAINT "storage_receipt_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "storage_receipt_bookingId_key" ON "storage_receipt"("bookingId");
