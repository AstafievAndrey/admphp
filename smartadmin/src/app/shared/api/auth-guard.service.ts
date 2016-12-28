import { Injectable }       from '@angular/core';
import {
    CanActivate, Router,
    ActivatedRouteSnapshot,
    RouterStateSnapshot,
    CanActivateChild
}                           from '@angular/router';
import {CookieService} from "angular2-cookie/services/cookies.service";

import {JsonApiService} from "./json-api.service";


@Injectable()
export class AuthGuard implements CanActivate, CanActivateChild {
    constructor(
        private router: Router, 
        private jsonApiService: JsonApiService,
        private cookieService:CookieService
    ) {}

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
        let url: string = state.url;

        return this.checkLogin(url);
    }
    
    canActivateChild(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
        return this.canActivate(route, state);
    }
    
    

    checkLogin(url: string): boolean {
        this.jsonApiService.post("//api.kalyan.space/check",{}).subscribe(
            data=>{
                if(data.s_error!==undefined){
                    this.router.navigate(['/auth']);
                }else{
                    console.log();
                    this.cookieService.put("token",data.token);
                }
            },
            error =>{
                this.router.navigate(['/auth']);
            }
        );
        return true;
    }
}
