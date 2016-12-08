import { Injectable } from '@angular/core';
import {Http, Response} from "@angular/http";

import {config} from '../smartadmin.config';
import {Observable} from "rxjs/Rx";

import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/delay';
import 'rxjs/add/operator/do';

@Injectable()
export class AuthService {

    constructor(private http: Http) {}
    
    public login(form:any):Observable<any>{
        console.log("auth login",form);
        localStorage.setItem('colorSetting', '#a4509b');
        return this.http.post("//api.kalyan.space/auth", JSON.stringify({"email":'admin@admin.ru',"password":"password"}))
            .map(response => response.json());
    }
  
}