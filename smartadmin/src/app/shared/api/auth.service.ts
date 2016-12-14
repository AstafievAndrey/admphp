import { Injectable } from '@angular/core';
import {Http, Response} from "@angular/http";
import {CookieService} from "angular2-cookie/services/cookies.service";

import {config} from '../smartadmin.config';
import {Observable} from "rxjs/Rx";

import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/delay';
import 'rxjs/add/operator/do';

@Injectable()
export class AuthService {

    constructor(private http: Http,private cookieService:CookieService) {}
    
    public login(form:any):Observable<any>{
        return this.http.post("//api.kalyan.space/auth", form)
            .map(response => response.json());
    }
  
}