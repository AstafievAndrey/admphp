import { Injectable }       from '@angular/core';
import { Http }             from '@angular/http';
import { Observable }       from 'rxjs/Observable';
import { AuthService }      from './auth.service';

import { Shop } from '../objects/shop';


@Injectable()
export class ShopService {
    
    constructor(private http:Http,private authService:AuthService){}
    
    listShop():Observable<any>{
            return this.http.post("//api.kalyan.space/listShop", 
                    JSON.stringify( this.authService.user))
                .map(response => response.json());
    }
    
    addShop(shop:Shop):Observable<any>{
            return this.http.post("//api.kalyan.space/addShop", 
                    JSON.stringify( { shop : shop, user : this.authService.user }))
                .map(response => response.json());
    }
    
    editShop(shop:Shop):Observable<any>{
            return this.http.post("//api.kalyan.space/editShop", 
                    JSON.stringify( { shop : shop, user : this.authService.user }))
                .map(response => response.json());
    }
    
    //очистим информацию по магазинам
    clearShop():Shop{
        return {
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
    
    getShop(id:any):Observable<any>{
        return this.http.post("//api.kalyan.space/getShop", 
                    JSON.stringify( { id : id, user : this.authService.user }))
                .map(response => response.json());
    }
    
}