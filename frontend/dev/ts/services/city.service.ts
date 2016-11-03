import { Injectable } from '@angular/core';
import { City } from '../objects/city';

@Injectable()
export class CityService {
    
    cities:City[];
    
    getCities(){
        if(this.cities===undefined){
            this.cities = [
                            {id:1,name:"Казань"},
                            {id:2,name:"Уфа"},
                            {id:3,name:"Ульяновск"},
                            {id:4,name:"Самара"},
                        ];
        } 
    }
    
}