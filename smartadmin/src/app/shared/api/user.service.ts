import { Injectable } from '@angular/core';
import {JsonApiService} from "./json-api.service";

@Injectable()
export class UserService {

    users:any;
    user:any;

    constructor(
        private jsonApiService:JsonApiService
    ) {}

    private _listUsers(){
        return this.jsonApiService.post("//api.kalyan.space/listUsers",{});
    }

    public addUser(){
        return this.jsonApiService.post("//api.kalyan.space/addUser",this.user);
    }

    getUsers(){
        this._listUsers()
            .subscribe(
                data=>{
                    this.users = data;
                }
            );
    }

    emptyUser(){
        this.user = {
            email:null,
            password:null,
            organization_id:null
        }
    }

}