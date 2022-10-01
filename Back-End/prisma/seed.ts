
import { PrismaClient } from '@prisma/client';

// initialize Prisma Client
const prisma = new PrismaClient();

async function main() {
    const workspace1 = await prisma.workspaces.upsert({
        where: { name: 'Flutter Community' },
        update: {},
        create: {
            name: 'Flutter Community',
            Description: 'Join in here for amazing flutter discussions',
            image: 'https://w7.pngwing.com/pngs/595/79/png-transparent-dart-programming-language-flutter-object-oriented-programming-flutter-logo-class-fauna-bird.png',
        },
      });
}

// execute the main function
main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    // close Prisma Client at the end
    await prisma.$disconnect();
  });
