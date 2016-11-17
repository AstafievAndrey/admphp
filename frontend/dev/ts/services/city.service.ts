import { Injectable } from '@angular/core';
import { City } from '../objects/city';

import { Http }             from '@angular/http';
import { Observable }       from 'rxjs/Observable';

@Injectable()
export class CityService {
    
    cities:City[];
    
    constructor(private http:Http){}
    
    listCity():Observable<any>{
         return this.http.post("//api.kalyan.space/listCity",'')
                .map(response => response.json());
    }
    
    getCities(){
        if(this.cities===undefined){
            this.listCity()
                .subscribe(
                    data=>{
                        this.cities = data;
                    }
                );
        } 
    }
    
}