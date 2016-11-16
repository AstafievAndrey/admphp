import { Injectable }       from '@angular/core';
import {
    CanActivate, Router,
    ActivatedRouteSnapshot,
    RouterStateSnapshot,
    CanActivateChild
}                           from '@angular/router';
import { AuthService }      from './auth.service';
import { CookieService }    from 'angular2-cookie/services/cookies.service';

@Injectable()
export class AuthGuard implements CanActivate, CanActivateChild {
    constructor(private authService: AuthService, private router: Router,private cookie:CookieService) {}

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
        let url: string = state.url;

        return this.checkLogin(url);
    }
    
    canActivateChild(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
        return this.canActivate(route, state);
    }

    checkLogin(url: string): boolean {
        
        this.authService.checkAuth()
            .subscribe(
                data => {
                    if(data.error===undefined){
                        this.authService.user.token = data.token;
                        this.cookie.putObject("user",this.authService.user);
                        return true;
                    }else{
                        console.log(false);
                        this.authService.logout();
                    }
//                    console.log(this.authService.user);
                },
                error => console.log("Error: " + error)
            );
            
        if (this.authService.user !==undefined) { return true; }

        // Store the attempted URL for redirecting
        this.authService.redirectUrl = url;

        // Navigate to the login page with extras
        this.router.navigate(['/login']);
        return false;
    }
}
