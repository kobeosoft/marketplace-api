import { Controller, Get } from '@nestjs/common';

import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getData() {
    return this.appService.getData();
  }

  @Get('health')
  healthCheck() {
    return 'OK';
  }

  @Get('ready')
  readinessCheck() {
    // Implémentez la logique pour déterminer si l'application est prête
    return 'OK';
  }
}
