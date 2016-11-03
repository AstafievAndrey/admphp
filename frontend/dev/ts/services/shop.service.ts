import { Injectable } from '@angular/core';
import { Shop } from '../objects/shop';

@Injectable()
export class ShopService {
    
    shops:Shop[];
    
    getShops(){
            return [
                {
                    id: 1,
                    enabled:1,
                    name: "Name one",
                    address:"Address one",
                    phone:"Phone one",
                    site:"Site one",
                    inst:"Instagram one",
                    vk:"Vk one",
                    city_id:1,
                    category_id:1,
                    short_desc:'Short Description one',
                    desc:'Description one',
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
                },
                {
                    id: 2,
                    enabled:0,
                    name: "Name two",
                    address:"Address two",
                    phone:"Phone two",
                    site:"Site two",
                    inst:"Instagram two",
                    vk:"Vk two",
                    city_id:1,
                    category_id:1,
                    short_desc:'Short Description two',
                    desc:'Description two',
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
            
            ];
    }
    
    getShop(id:number){
        return {
                id: id,
                enabled:1,
                name: 'тест',
                address:'тест',
                phone:'тест',
                site:'тест',
                inst:'тест',
                vk:'тест',
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
    
}