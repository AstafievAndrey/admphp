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

    public getShop(id:number){
        return this.jsonApiService.post("//api.kalyan.space/getShop",{id:id});
    }

    public editShop(form:any){
        return this.jsonApiService.post("//api.kalyan.space/editShop",form);
    }

    public emptyShop(){
        this.shop = {
            id:null,
            seo_translit:null,
            seo_title:null,
            seo_desc:null,
            seo_keys:null,
            org_id:null,
            name:null,
            address:null,
            phone:null,
            short_desc:null,
            city_id:null,
            category_id:null,
            organization_id:null,
            site:null,
            vk:null,
            inst:null,
            alcohol:"false",
            food:"false",
            veranda:"false",
            parking:"false",
            board:"false",
            console:"false",
            description:null,
            lat:null,
            lon:null,
            shedule:[
                    {id:1,name:"Понедельник",type_work:"1",work_begin:"1",work_end:"1"},
                    {id:2,name:"Вторник",type_work:"1",work_begin:"1",work_end:"1"},
                    {id:3,name:"Среда",type_work:"1",work_begin:"1",work_end:"1"},
                    {id:4,name:"Четверг",type_work:"1",work_begin:"1",work_end:"1"},
                    {id:5,name:"Пятница",type_work:"1",work_begin:"1",work_end:"1"},
                    {id:6,name:"Суббота",type_work:"1",work_begin:"1",work_end:"1"},
                    {id:7,name:"Воскресенье",type_work:"1",work_begin:"1",work_end:"1"}
                ]
        }
    }


}