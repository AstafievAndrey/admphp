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
    
    constructor(public cityService:CityService,public categoryService:CategoryService,private shopService:ShopService){
//        this.numbers = Array(24).fill().map((x,i)=>i+1);//работает в браузерах поддерживающих EcmaScript 6
        this.numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24];
        this.shop = {
                        id: null,
                        enabled:1,
                        active:0,
                        name: null,
                        address:null,
                        phone:null,
                        site:null,
                        inst:null,
                        vk:null,
                        city_id:1,
                        category_id:1,
                        short_desc:'',
                        desc:'',
                        parking:"false",
                        alcohol:"false",
                        food:"false",
                        veranda:"false",
                        console:"false",
                        board:"false",
                        shedule:[   
                                    {id:0,name:"Понедельник",type_work:"1",work_begin:"1",work_end:"24"},
                                    {id:1,name:"Вторник",type_work:"1",work_begin:"1",work_end:"24"},
                                    {id:2,name:"Среда",type_work:"1",work_begin:"1",work_end:"24"},
                                    {id:3,name:"Четверг",type_work:"1",work_begin:"1",work_end:"24"},
                                    {id:4,name:"Пятница",type_work:"1",work_begin:"1",work_end:"24"},
                                    {id:5,name:"Суббота",type_work:"1",work_begin:"1",work_end:"24"},
                                    {id:6,name:"Воскресенье",type_work:"1",work_begin:"1",work_end:"24"}
                                ],
                        file:null
                    }
    }
    
    ngOnInit(){
        this.cityService.getCities();
        this.categoryService.getCategories(1);
    }
        
    onSubmit(){
//        console.log(this.shop);
        this.shopService.addShop(this.shop).subscribe(
            data =>{
                console.log(data);
            }
        );
    }
    
}
