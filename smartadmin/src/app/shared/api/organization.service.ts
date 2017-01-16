import { Injectable } from '@angular/core';
import {JsonApiService} from "./json-api.service";

@Injectable()
export class OrganizationService {

    organizations:any;
    organization:any;

    constructor(
        private jsonApiService:JsonApiService
    ) {}

    private _listOrganizations(){
        return this.jsonApiService.post("//api.kalyan.space/listOrganizations",{});
    }

    public addOrganization(){
        return this.jsonApiService.post("//api.kalyan.space/addOrganization",this.organization);
    }

    getOrganizations(){
        this._listOrganizations()
            .subscribe(
                data=>{
                    this.organizations = data;
                }
            );
    }

    emptyOrganization(){
        this.organization = {
            name:null,
            address:null,
            phone:null,
            email:null
        }
    }

}