import { Injectable } from '@angular/core';
import {JsonApiService} from "./json-api.service";

@Injectable()
export class ShopService {

    constructor(
        private jsonApiService:JsonApiService
    ) {}

    public addShop(form:any){
        return this.jsonApiService.post("//api.kalyan.space/addShop",form);
    }



}