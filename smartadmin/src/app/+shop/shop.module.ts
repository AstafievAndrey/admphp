import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { shopRouting } from './shop.routing';
import {SmartadminModule} from "../shared/smartadmin.module";
import {ShopComponent} from "./shop.component";

@NgModule({
  imports: [
    CommonModule,
    shopRouting,
      SmartadminModule
  ],
  declarations: [ShopComponent]
})
export class ShopModule { }
