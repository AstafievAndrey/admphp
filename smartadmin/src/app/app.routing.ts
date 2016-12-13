
import {Routes, RouterModule} from '@angular/router';
import {MainLayoutComponent} from "./shared/layout/app-layouts/main-layout.component";
import {AuthLayoutComponent} from "./shared/layout/app-layouts/auth-layout.component";
import { AuthGuard }                from './shared/api/auth-guard.service';

export const routes: Routes = [
    {
        path: '',
        component: MainLayoutComponent,
        children: [
            {
                path: '', redirectTo: 'home', pathMatch: 'full'
            },
            {
                path: 'home',
                loadChildren: 'app/+home/home.module#HomeModule'
            },
            {
                path: 'shop',
                loadChildren: 'app/+shop/shop.module#ShopModule'
            },
        ]
    },
    { path: 'auth', component: AuthLayoutComponent, loadChildren: 'app/+auth/auth.module#AuthModule'},
    { path: '**', redirectTo: 'auth'}
];

export const routing = RouterModule.forRoot(routes);
