import { Routes, RouterModule } from '@angular/router';
// import {ShopComponent} from "./shop.component";
import { ListShopComponent }        from './components/listShop.component';

export const shopRoutes: Routes = [
    {
        path: '',
        component: ListShopComponent,
        data: {
            pageTitle: 'Заведения'
        },
    },
    {
        path: 'listShop',
        component: ListShopComponent
    },
];

export const shopRouting = RouterModule.forChild(shopRoutes);

