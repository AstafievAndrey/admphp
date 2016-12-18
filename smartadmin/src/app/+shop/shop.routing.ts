import { Routes, RouterModule } from '@angular/router';
import {ListShopComponent} from "./components/listShop.component";
import {AddShopComponent} from "./components/addShop.component";

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
    }
];

export const shopRouting = RouterModule.forChild(shopRoutes);

