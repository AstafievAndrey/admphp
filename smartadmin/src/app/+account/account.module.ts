import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { accountRouting } from './account.routing';
import {SmartadminModule} from "../shared/smartadmin.module";
import {AccountComponent} from "./account.component";
import {OrganizationComponent} from "./organization/organization.component";
import {AddOrganizationComponent} from "./organization/addOrganization.component";
import {UserComponent} from "./user/user.component";
import {AddUserComponent} from "./user/addUser.component";
import { SmartadminValidationModule } from "../shared/forms/validation/smartadmin-validation.module";

import {OrganizationService} from "../shared/api/organization.service";
import {UserService} from "../shared/api/user.service";

import {XSRFStrategy, CookieXSRFStrategy} from "@angular/http";

@NgModule({
  imports: [
    CommonModule,
    SmartadminValidationModule,
    accountRouting,
      SmartadminModule
  ],
  declarations: [AccountComponent,OrganizationComponent,UserComponent,AddOrganizationComponent, AddUserComponent],
  providers:[
      OrganizationService,UserService,
      { provide: XSRFStrategy, useValue: new CookieXSRFStrategy('token', 'Token') }
  ]
})
export class AccountModule { }
