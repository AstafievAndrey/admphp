import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {FormsModule} from "@angular/forms";

import {NavigationModule} from "./navigation/navigation.module";
import {RibbonComponent} from "./ribbon/ribbon.component";
import {ShortcutComponent} from "./shortcut/shortcut.component";
import {ToggleActiveDirective} from "./utils/toggle-active.directive";
import { MainLayoutComponent } from './app-layouts/main-layout.component';
import { EmptyLayoutComponent } from './app-layouts/empty-layout.component';
import {RouterModule} from "@angular/router";
import { AuthLayoutComponent } from './app-layouts/auth-layout.component';
import {TooltipModule, DropdownModule} from "ng2-bootstrap";
import { RouteBreadcrumbsComponent } from './ribbon/route-breadcrumbs.component';

@NgModule({
  imports: [
    CommonModule,
    NavigationModule,
    FormsModule,
    RouterModule,

    TooltipModule,
    DropdownModule,
  ],
  declarations: [
    RibbonComponent,
    ShortcutComponent,
    ToggleActiveDirective,
    MainLayoutComponent,
    EmptyLayoutComponent,
    AuthLayoutComponent,
    RouteBreadcrumbsComponent,
  ],
  exports:[
    NavigationModule,
    RibbonComponent,
    ShortcutComponent,
    ToggleActiveDirective,
  ]
})
export class SmartadminLayoutModule{

}
