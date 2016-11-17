import { Injectable } from '@angular/core';
import { Category } from '../objects/category';

import { Http }             from '@angular/http';
import { Observable }       from 'rxjs/Observable';

@Injectable()
export class CategoryService {
    
    categories:Category[];
    
    constructor(private http:Http){}
    
    private listCategory(parent_id:number):Observable<any>{
        return this.http.post("//api.kalyan.space/listCategory", JSON.stringify({"parent_id":parent_id}))
                .map(response => response.json());
    }
    
    getCategories(parent_id:number){
        this.listCategory(parent_id)
                .subscribe(
                    data=>{
                        this.categories = data;
                    }
                );
    }
    
    getCategoriesProducts():Category[]{
        return  [
                    {id:1,name:"Товары"},
                    {id:2,name:"Услуги"},
                    {id:3,name:"Другое"}
                ];
    }
    
}