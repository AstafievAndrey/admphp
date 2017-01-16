import { Routes, RouterModule } from '@angular/router';
import {AccountComponent} from "./account.component";
import {OrganizationComponent} from "./organization/organization.component";
import {UserComponent} from "./user/user.component";
import {AddOrganizationComponent} from "./organization/addOrganization.component";
import {AddUserComponent} from "./user/addUser.component";

export const accountRoutes: Routes = [
    {
        path:'',
        redirectTo: 'organization',
        pathMatch: 'full'
    },
    {
        path: 'organization',
        children:[
            {
                path: '',
                component: OrganizationComponent,
            },
            {
                path: 'add',
                component: AddOrganizationComponent,
            },
        ]
    },
    {
        path: 'user',
        children:[
            {
                path: '',
                component: UserComponent,
            },
            {
                path: 'add',
                component: AddUserComponent,
            },
        ]
    },
];

export const accountRouting = RouterModule.forChild(accountRoutes);

