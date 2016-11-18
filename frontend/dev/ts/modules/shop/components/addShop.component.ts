import { Component, OnInit } from '@angular/core';

import { Shop } from '../../../objects/shop';

import { CityService } from '../../../services/city.service';
import { CategoryService } from '../../../services/category.service';
import { ShopService } from '../../../services/shop.service';


@Component({
    templateUrl:'app/html/shop.component.html'
})

export class AddShopComponent implements OnInit{
    
    shop:Shop;
    numbers:number[];
    message:any;
    disabled:boolean;
    
    constructor(public cityService:CityService,public categoryService:CategoryService,private shopService:ShopService){
//        this.numbers = Array(24).fill().map((x,i)=>i+1);//работает в браузерах поддерживающих EcmaScript 6
        this.numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24];
        this.shop = shopService.clearShop();
        this.disabled = false;
        this.message = {hide:true,text:"",class:""};
    }
    
    ngOnInit(){
        this.cityService.getCities();
        this.categoryService.getCategories(1);
    }
        
    onSubmit(){
        this.disabled = true;
        this.shopService.addShop(this.shop).subscribe(
            data =>{
                this.disabled = false;
                if(data.error!==undefined){
                    this.message = {hide:false,text:data.error,class:" alert alert-danger bounceInRight animated"};
                }else{
                    this.shop = this.shopService.clearShop();
                    this.message = {hide:false,text:"Cохранено",class:" alert alert-success bounceInRight animated"};
                    setTimeout(() => {  
                        this.message.hide = true;
                    }, 2000);
                }
            }
        );
    }
    
}
