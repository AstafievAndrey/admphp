import { Injectable } from '@angular/core';
import {CookieService} from "angular2-cookie/services/cookies.service";

import {config} from '../smartadmin.config';
import {JsonApiService} from "./json-api.service";

@Injectable()
export class AuthService {

    constructor(
                private cookieService:CookieService,
                private jsonApiService:JsonApiService
            ) {}
    
    public login(form:any){
        return this.jsonApiService.post("//api.kalyan.space/auth",form);
    }
  
}