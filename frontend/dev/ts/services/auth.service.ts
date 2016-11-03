import { Injectable } from '@angular/core';
import { Http } from '@angular/http';

import { Observable } from 'rxjs/Observable';

export class User{   
    token: string;
}

@Injectable()
export class AuthService {
    isLoggedIn: boolean = false;

    redirectUrl: string;
    
    foods;
    
    constructor(private http:Http){}
    
    getData(): Observable<any> {
        return this.http.get("http://api.kalyan.space/auth?email=admin@email.ru&password=password")
            .map(response => response.json());
    }

    login(email,password): Observable<boolean> {
        return this.http.post("//api.kalyan.space/auth", JSON.stringify({"email":email,"password":password}))
            .map(response => response.json());
//        this.http.get('http://api.kalyan.space/auth?email=admin@email.ru&password=password')
//                    .map(this.extractData)
//                    .catch(this.handleError);
//        return Observable.of(true).delay(1000).do(val => this.isLoggedIn = true);
    }
    

    logout(): void {
        this.isLoggedIn = false;
    }
}
