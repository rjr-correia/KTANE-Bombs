/*
  Warnings:

  - Added the required column `seasonSolve` to the `Completion` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Completion" ADD COLUMN     "seasonSolve" BOOLEAN NOT NULL;
