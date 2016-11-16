import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { shopRouting}  from './shop.routing';
import { FormsModule }      from '@angular/forms';
         
import { ShopComponent }   from './shop.component';
import { ListShopComponent }   from './components/listShop.component';
import { AddShopComponent }         from './components/addShop.component';
import { EditShopComponent }         from './components/editShop.component';

@NgModule({
    imports:      [ 
        BrowserModule,
        FormsModule,
        shopRouting 
    ],
    declarations: [ 
        ShopComponent,
        ListShopComponent,
        AddShopComponent,
        EditShopComponent
    ],
    providers: [

    ],
    bootstrap:    [ ShopComponent ],
})

export class ShopModule { }
