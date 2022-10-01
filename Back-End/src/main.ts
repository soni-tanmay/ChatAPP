import { NestFactory } from '@nestjs/core'
import { NestExpressApplication } from '@nestjs/platform-express'
import { AppModule } from './app.module'
import { configureSwagger } from './config/swagger.config'

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule)

  await configureSwagger(app)

  await app.listen(3000)
}
bootstrap()
