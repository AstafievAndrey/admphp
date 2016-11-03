import { Component, OnInit} from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';

import { Shop } from '../../../objects/shop';

import { ShopService } from '../../../services/shop.service';
import { CityService } from '../../../services/city.service';
import { CategoryService } from '../../../services/category.service';

@Component({
    templateUrl:'app/html/shop.component.html'
})

export class EditShopComponent implements OnInit{
    
    shop:Shop;
    numbers:number[];
    
    constructor(public cityService:CityService,public categoryService:CategoryService,
                private route: ActivatedRoute, private shopService:ShopService){
                    this.numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24];
                }
    
    ngOnInit():void{
        this.cityService.getCities();
        this.categoryService.getCategories();
        this.route.params.forEach((params:Params)=>{
            this.shop = this.shopService.getShop(params['id']);
        });
    }
    
    onSubmit(){
        console.log(this.shop);
    }
    
}


