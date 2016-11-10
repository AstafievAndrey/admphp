import { Injectable }       from '@angular/core';
import { Http }             from '@angular/http';

import { Observable }       from 'rxjs/Observable';
import { CookieService }    from 'angular2-cookie/services/cookies.service';
import { User }             from '../objects/user';

@Injectable()
export class AuthService {
    user: User;
    obj:any;
    redirectUrl: string;
    
    foods;
    
    constructor(private http:Http,private cookie:CookieService){
        this.obj = this.cookie.getObject("user");
        if(this.cookie.getObject("user")!==undefined){
            this.user = {id:this.obj.id,email:this.obj.email,token:this.obj.token};
        }
    }

    login(email,password): Observable<any> {
        return this.http.post("//api.kalyan.space/auth", JSON.stringify({"email":email,"password":password}))
            .map(response => response.json());
    }
    

    logout(): void {
        this.cookie.removeAll();
        this.user = undefined;
    }
}
