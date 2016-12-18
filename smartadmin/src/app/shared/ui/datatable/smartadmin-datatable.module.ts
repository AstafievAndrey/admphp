import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DatatableComponent } from './datatable.component';
import {HttpModule} from '@angular/http';
import {CookieService} from "angular2-cookie/services/cookies.service";

// require('smartadmin-plugins/bower_components/datatables.net-colreorder-bs/css/colReorder.bootstrap.min.css');

@NgModule({
  imports: [
    CommonModule,HttpModule
  ],
  declarations: [DatatableComponent],
  exports: [DatatableComponent,HttpModule],
  providers: [CookieService]
})
export class SmartadminDatatableModule { }
