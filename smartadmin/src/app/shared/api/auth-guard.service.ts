import { Injectable }       from '@angular/core';
import {
    CanActivate, Router,
    ActivatedRouteSnapshot,
    RouterStateSnapshot,
    CanActivateChild
}                           from '@angular/router';
import {CookieService} from "angular2-cookie/services/cookies.service";

import {JsonApiService} from "./json-api.service";
import {Observable} from "rxjs";


@Injectable()
export class AuthGuard implements CanActivate, CanActivateChild {

    login:boolean = false;

    constructor(
        private router: Router, 
        private jsonApiService: JsonApiService,
        private cookieService:CookieService
    ) {}

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
        return this.checkLogin().then((res)=>{return res;});
    }
    
    canActivateChild(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
        return this.canActivate(route, state);
    }

    checkLogin() {
        return new Promise((resolve, reject) => {
            this.jsonApiService.post("//api.kalyan.space/check",{}).subscribe(
                data=>{
                    if(data.s_error!==undefined){
                        this.router.navigate(['/auth']);
                        reject(false);
                    }else{
                        this.cookieService.put("token",data.token);
                        resolve(true);
                    }
                },
                error =>{
                    this.router.navigate(['/auth']);
                }
            );
        });
    }
}
