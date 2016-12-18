import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { shopRouting } from './shop.routing';
import {SmartadminModule} from "../shared/smartadmin.module";
import {ShopComponent} from "./shop.component";
import { ListShopComponent }   from './components/listShop.component';
import {SmartadminDatatableModule} from "../shared/ui/datatable/smartadmin-datatable.module";

@NgModule({
  imports: [
      CommonModule,
      shopRouting,
      SmartadminDatatableModule,
      SmartadminModule
  ],
  declarations: [ShopComponent,ListShopComponent]
})
export class ShopModule { }
