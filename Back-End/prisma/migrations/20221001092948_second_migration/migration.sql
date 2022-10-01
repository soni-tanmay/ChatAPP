/*
  Warnings:

  - A unique constraint covering the columns `[name]` on the table `Workspaces` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Workspaces_name_key" ON "Workspaces"("name");
