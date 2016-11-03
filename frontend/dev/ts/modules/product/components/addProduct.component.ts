import { Component,OnInit } from '@angular/core';

import { Product } from '../../../objects/product';
import { CategoryService } from '../../../services/category.service';


@Component({
    templateUrl:"app/html/product.component.html"
})

export class AddProductComponent implements OnInit{
    
    product:Product;
    
    constructor(public categoryService:CategoryService){
        this.product = {
            id:null,
            name:null,
            price:null,
            desc:null,
            short_desc:null,
            category_id:1,
            active:false
        }
    }
    
    ngOnInit(){}
    
    onSubmit(){
        console.log(this);
    }
    
}


