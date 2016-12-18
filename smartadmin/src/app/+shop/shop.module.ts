import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { shopRouting } from './shop.routing';
import { SmartadminValidationModule } from "../shared/forms/validation/smartadmin-validation.module";
import {SmartadminModule} from "../shared/smartadmin.module";
import {ShopComponent} from "./shop.component";
import {ListShopComponent} from "./components/listShop.component";
import {AddShopComponent} from "./components/addShop.component";
import {SmartadminDatatableModule} from "../shared/ui/datatable/smartadmin-datatable.module";

@NgModule({
  imports: [
      CommonModule,
      shopRouting,
      SmartadminValidationModule,
      SmartadminDatatableModule,
      SmartadminModule
  ],
  declarations: [ShopComponent,ListShopComponent,AddShopComponent]
})
export class ShopModule { }
