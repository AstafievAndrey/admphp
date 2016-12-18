import { NgModule } from '@angular/core';
import { FormsModule }   from '@angular/forms';
import { SmartadminValidationModule } from "../shared/forms/validation/smartadmin-validation.module";
import { CommonModule } from '@angular/common';
import { LoginComponent } from './login/login.component';
import { LockedComponent } from './locked/locked.component';
import { RegisterComponent } from './register/register.component';
import { ForgotComponent } from './forgot/forgot.component';
import {routing} from "./auth.routing";
import { AuthComponent } from './auth.component';
import {CookieService} from "angular2-cookie/services/cookies.service";
import {AuthService} from "../shared/api/auth.service";

@NgModule({
  imports: [
      CommonModule,
      FormsModule,
      SmartadminValidationModule,
      routing,
  ],
  declarations: [LoginComponent, LockedComponent,
    RegisterComponent, ForgotComponent, AuthComponent],
  providers:[CookieService,AuthService]
})
export class AuthModule { }
