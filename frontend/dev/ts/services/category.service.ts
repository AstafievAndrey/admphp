import { Injectable } from '@angular/core';
import { Category } from '../objects/category';

@Injectable()
export class CategoryService {
    
    categories:Category[];
    
    getCategories(){
        console.log(this.categories);
        if(this.categories===undefined){
            this.categories = [
                            {id:1,name:"Кальянная"},
                            {id:2,name:"Магазин"},
                            {id:3,name:"Другое"}
                        ];
        } 
    }
    
    getCategoriesProducts():Category[]{
        return  [
                    {id:1,name:"Товары"},
                    {id:2,name:"Услуги"},
                    {id:3,name:"Другое"}
                ];
    }
    
}