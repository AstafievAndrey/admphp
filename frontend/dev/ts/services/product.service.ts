import { Injectable } from '@angular/core';
import { Product } from '../objects/product';

@Injectable()
export class ProductService {
    
    getProducts():Product[]{
        return [
            {id:1,name:"Product one",category_id:1,price:"500",desc:"Desc",short_desc:"Short Desc",active:true},
            {id:2,name:"Product two",category_id:1,price:"500",desc:"Desc",short_desc:"Short Desc",active:false},
        ];
    }
    
    getProduct(id:number):Product{
        return {id:id,name:"Product one",category_id:1,price:"500",desc:"Desc",short_desc:"Short Desc",active:true};
    }
    
}