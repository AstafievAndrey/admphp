import { Injectable } from '@angular/core';
import {JsonApiService} from "./json-api.service";

@Injectable()
export class OrganizationService {

    organizations:any;

    constructor(
        private jsonApiService:JsonApiService
    ) {}

    private listOrganizations(){
        return this.jsonApiService.post("//api.kalyan.space/listOrganizations",{});
    }

    getOrganizations(){
        this.listOrganizations()
            .subscribe(
                data=>{
                    this.organizations = data;
                }
            );
    }

}