import { Injectable }       from '@angular/core';
import { Http }             from '@angular/http';
import { Router }           from '@angular/router';

import { Observable }       from 'rxjs/Observable';
import { CookieService }    from 'angular2-cookie/services/cookies.service';
import { User }             from '../objects/user';

@Injectable()
export class AuthService {
    user: User;
    obj:any;
    redirectUrl: string;
    
    constructor(private http:Http,private cookie:CookieService,private router: Router){
        this.obj = this.cookie.getObject("user");
        if(this.cookie.getObject("user")!==undefined){
            this.user = {id:this.obj.id,email:this.obj.email,token:this.obj.token,org_id:this.obj.org_id};
        }
    }
    
    checkAuth():Observable<any>{
        if(this.user===undefined){
            this.router.navigate(['/login']);
            return;
        }else{
            return this.http.post("//api.kalyan.space/check", JSON.stringify({ "id": this.user.id,"email":this.user.email,"token":this.user.token}))
                .map(response => response.json());
        }
    }

    login(email,password): Observable<any> {
        return this.http.post("//api.kalyan.space/auth", JSON.stringify({"email":email,"password":password}))
            .map(response => response.json());
    }
    

    logout(): void {
        this.cookie.removeAll();
        this.user = undefined;
        this.router.navigate(['/login']);
    }
}
