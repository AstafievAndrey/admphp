import { ModuleWithProviders }  from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AuthGuard }                from '../../services/auth-guard.service';
import { FileComponent }            from './file.component';

const fileRoutes: Routes = [
    { 
        path: 'file',  
        component: FileComponent, 
//        canActivate: [AuthGuard],
//        children: [
//            {
//                path: '',
//                canActivateChild: [AuthGuard],
//                children: [
//                    { path: '', component:FileComponent},
//                ]
//            }
//        ]
    },
];

export const fileRouting: ModuleWithProviders = RouterModule.forChild(fileRoutes);