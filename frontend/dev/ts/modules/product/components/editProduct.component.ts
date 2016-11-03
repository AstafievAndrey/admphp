import { Component,OnInit } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';

import { Product } from '../../../objects/product';
import { CategoryService } from '../../../services/category.service';
import { ProductService } from '../../../services/product.service';

@Component({
    templateUrl:"app/html/product.component.html"
})

export class EditProductComponent implements OnInit{
    
    product:Product;
    
    constructor(public categoryService:CategoryService,
                private route: ActivatedRoute,
                private productService:ProductService){
    }
    
    ngOnInit(){
        this.route.params.forEach((params:Params)=>{
            this.product = this.productService.getProduct(params['id']);
        });
    }
    
    onSubmit(){
        console.log(this);
    }
    
}