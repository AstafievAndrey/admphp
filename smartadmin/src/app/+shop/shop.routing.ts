import { Routes, RouterModule } from '@angular/router';
import {ShopComponent} from "./shop.component";

export const shopRoutes: Routes = [
    {
        path: '',
        component: ShopComponent,
        data: {
            pageTitle: 'Заведения'
        }
    }
];

export const shopRouting = RouterModule.forChild(shopRoutes);

