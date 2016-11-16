import { Component, OnInit } from '@angular/core';
import { ShopService } from '../../../services/shop.service';

@Component({
    templateUrl:'app/html/listShop.component.html'
})

export class ListShopComponent implements OnInit{ 
    
    shops:any[];
    
    constructor(private shopService:ShopService){}
    
    ngOnInit(){
        this.shopService.listShop().subscribe(
            data=>{
                this.shops = data;
            }
        );
    }
    
}