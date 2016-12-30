import { Routes, RouterModule } from '@angular/router';
import {ListShopComponent} from "./components/listShop.component";
import {AddShopComponent} from "./components/addShop.component";
import {EditShopComponent} from "./components/editShop.component";

export const shopRoutes: Routes = [
    {
        path: '',
        redirectTo:'listShop',
        data: {
            pageTitle: 'Заведения'
        },
    },
    {
        path:'listShop',
        component:ListShopComponent
    },
    {
        path:'addShop',
        component:AddShopComponent
    },
    {
        path:'editShop/:id',
        component:EditShopComponent
    }
];

export const shopRouting = RouterModule.forChild(shopRoutes);

