import { Component, OnInit } from '@angular/core';
import { ShopService } from '../../../services/shop.service';

@Component({
    templateUrl:'app/html/listShop.component.html'
})

export class ListShopComponent implements OnInit{ 
    
    shops:any[];
    message:any;
    
    constructor(private shopService:ShopService){
        this.shops = undefined;
        this.message = {hide:true,text:"",class:""};
    }
    
    del(i,id){
        this.shopService.del(id).subscribe(data=>{
            if(data.error!==undefined){
                this.message = {hide:false,text:data.error,class:" alert alert-danger bounceInRight animated"};
            }else{
                this.message = {hide:false,text:"Удалено",class:" alert alert-success bounceInRight animated"};
                this.shops.splice(i,1);
                setTimeout(() => {  
                    this.message.hide = true;
                }, 2000);
            }
        });
    }
    
    ngOnInit(){        
        this.shopService.listShop().subscribe(
            data=>{
                this.shops = data;
            }
        );
    }
    
}