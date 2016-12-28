import { Injectable } from '@angular/core';
import {JsonApiService} from "./json-api.service";

@Injectable()
export class CityService {

    cities:any;

    constructor(
        private jsonApiService:JsonApiService
    ) {}

    private listCities(){
        return this.jsonApiService.post("//api.kalyan.space/listCity",{});
    }

    getCities(){
        this.listCities()
            .subscribe(
                data=>{
                    this.cities = data;
                }
            );
    }

}