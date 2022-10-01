import { NestExpressApplication } from '@nestjs/platform-express'
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger'
import { RedocModule, RedocOptions } from '@nicholas.braun/nestjs-redoc'

const configureSwagger = async (app: NestExpressApplication) => {
  // Configure swagger.
  const config = new DocumentBuilder()
    .setTitle('Chat App API')
    .setDescription('Documentation for Chat App API')
    .setVersion('1.0')
    .build()

  const document = SwaggerModule.createDocument(app, config, {
    deepScanRoutes: true,
    operationIdFactory: (_, method) => method,
  })

  // Redoc options.
  const redocOptions: RedocOptions = {
    title: 'Chat App API',
    sortPropsAlphabetically: true,
    hideDownloadButton: false,
    hideHostname: true,
    // logo: {
    //   // url: 'https://www.coreswt.com/wp-content/uploads/2020/04/CORE-1-PNG-2.jpg',
    //   backgroundColor: '#F0F0F0',
    //   altText: 'Coresports Logo',
    // },
    // auth: {
    //   enabled: true,
    //   user: process.env.SWAGGER_USER,
    //   password: process.env.SWAGGER_PASS,
    // },
  }
  await RedocModule.setup('/docs', app, document, redocOptions)
}

export { configureSwagger }
