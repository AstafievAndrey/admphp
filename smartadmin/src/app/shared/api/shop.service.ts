import { Injectable } from '@angular/core';
import {JsonApiService} from "./json-api.service";

@Injectable()
export class ShopService {

    public shop:any;
    public numbers:number[];

    constructor(
        private jsonApiService:JsonApiService
    ) {
        this.numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24];
    }

    public addShop(form:any){
        return this.jsonApiService.post("//api.kalyan.space/addShop",form);
    }

    public emptyShop(){
        this.shop = {
            seo_translit:"",
            seo_title:"",
            seo_desc:"",
            seo_keys:"",
            org_id:"",
            name:"",
            address:"",
            phone:"",
            short_desc:"",
            city_id:"",
            category_id:"",
            site:"",
            vk:"",
            inst:"",
            alcohol:"false",
            food:"false",
            veranda:"false",
            parking:"false",
            board:"false",
            game:"false",
            description:"",
            shedule:[
                    {id:1,name:"Понедельник",type_work:"1"},
                    {id:2,name:"Вторник",type_work:"1"},
                    {id:3,name:"Среда",type_work:"1"},
                    {id:4,name:"Четверг",type_work:"1"},
                    {id:5,name:"Пятница",type_work:"1"},
                    {id:6,name:"Суббота",type_work:"1"},
                    {id:7,name:"Воскресенье",type_work:"1"}
                ]
        }
    }


}