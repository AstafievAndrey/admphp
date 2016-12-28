import { Injectable } from '@angular/core';
import {JsonApiService} from "./json-api.service";

@Injectable()
export class CategoryService {

    categories:any;

    constructor(
        private jsonApiService:JsonApiService
    ) {}

    private listCategory(id:number){
        return this.jsonApiService.post("//api.kalyan.space/listCategory",{parent_id:id});
    }

    getCategories(parent_id:number){
        this.listCategory(parent_id)
            .subscribe(
                data=>{
                    this.categories = data;
                }
            );
    }

}