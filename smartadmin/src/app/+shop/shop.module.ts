import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { shopRouting } from './shop.routing';
import { SmartadminValidationModule } from "../shared/forms/validation/smartadmin-validation.module";
import {SmartadminModule} from "../shared/smartadmin.module";
import {ShopComponent} from "./shop.component";
import {SmartadminDatatableModule} from "../shared/ui/datatable/smartadmin-datatable.module";
import {SmartadminEditorsModule} from "../shared/forms/editors/smartadmin-editors.module";
import {SmartadminInputModule} from "../shared/forms/input/smartadmin-input.module";
import {ShopService} from "../shared/api/shop.service";
import {CategoryService} from "../shared/api/category.service";
import {CityService} from "../shared/api/city.service";
import {OrganizationService} from "../shared/api/organization.service";

import {DataTableModule} from "angular2-datatable";

import {EditShopComponent} from "./components/editShop.component";
import {ListShopComponent} from "./components/listShop.component";
import {AddShopComponent} from "./components/addShop.component";
import {XSRFStrategy, CookieXSRFStrategy} from "@angular/http";

@NgModule({
    imports: [
        CommonModule,
        shopRouting,
        DataTableModule,
        SmartadminValidationModule,
        SmartadminDatatableModule,
        SmartadminEditorsModule,
        SmartadminInputModule,
        SmartadminModule,
    ],
    declarations: [ShopComponent,ListShopComponent,AddShopComponent,EditShopComponent],
    providers:[
        ShopService,CategoryService,CityService,OrganizationService,
        { provide: XSRFStrategy, useValue: new CookieXSRFStrategy('token', 'Token') }
    ]
})
export class ShopModule { }
