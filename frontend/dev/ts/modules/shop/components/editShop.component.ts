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
    message:any;
    disabled:boolean;
    
    constructor(public cityService:CityService,public categoryService:CategoryService,
                private route: ActivatedRoute, private shopService:ShopService){
        this.numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24];
        this.disabled = true;
        this.message = {hide:true,text:"",class:""};
        this.shop = shopService.clearShop();
    }
    
    ngOnInit():void{
        this.cityService.getCities();
        this.categoryService.getCategories(1);
        this.route.params.forEach((params:Params)=>{
            this.shopService.getShop(params['id']).subscribe(
                data =>{
                    this.disabled = false;
                    if(data.error!==undefined){
                        this.message = {hide:false,text:data.error,class:" alert alert-danger bounceInRight animated"};
                    }else{
                        this.shop = data;
                        console.log(data);
                    }
                }
            );
        });
    }
    
    onSubmit(){
        console.log(this.shop);
        this.shopService.editShop(this.shop).subscribe(
            data =>{
                console.log(data);
            }
        );
    }
    
}


