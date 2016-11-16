import { ModuleWithProviders }  from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AuthGuard }                from '../../services/auth-guard.service';
import { ShopComponent }            from './shop.component';
import { ListShopComponent }        from './components/listShop.component';
import { AddShopComponent }         from './components/addShop.component';
import { EditShopComponent }        from './components/editShop.component';

const shopRoutes: Routes = [
    { 
        path: 'shop',  
        component: ShopComponent, 
        children: [
            {
                path: '',
                canActivateChild: [AuthGuard],
                children: [
                    { path: '', component: ListShopComponent },
                    { path: 'add', component: AddShopComponent },
                    { path: 'edit', redirectTo: '/shop',pathMatch: 'full' },
                    { path: 'edit/:id', component: EditShopComponent }
                ]
            }
        ]
    },
];

export const shopRouting: ModuleWithProviders = RouterModule.forChild(shopRoutes);