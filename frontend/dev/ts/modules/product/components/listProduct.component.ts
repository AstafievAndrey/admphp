import { Component,OnInit } from '@angular/core';

import { Product }          from '../../../objects/product';
import { ProductService }   from '../../../services/product.service'; 

@Component({
    templateUrl:"app/html/listProduct.component.html"
})

export class ListProductComponent implements OnInit{
    
    products:Product[];
    
    constructor(private productService:ProductService){}
    
    ngOnInit(){
        this.products = this.productService.getProducts();
    }
    
}
