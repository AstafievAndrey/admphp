import { Component, OnInit } from '@angular/core';
import {CookieService} from "angular2-cookie/services/cookies.service";

@Component({
  templateUrl: '../html/formShop.component.html',
})
export class AddShopComponent implements OnInit {

  shedule:any[];
  numbers:number[];
  user:any;


  constructor(private cookieService:CookieService) {
    this.user = this.cookieService.getObject("user");
  }

  ngOnInit() {
    this.numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24];
    this.shedule = [
      {id:1,name:"Понедельник",type_work:1},
      {id:2,name:"Вторник",type_work:1},
      {id:3,name:"Среда",type_work:1},
      {id:4,name:"Четверг",type_work:1},
      {id:5,name:"Пятница",type_work:1},
      {id:6,name:"Суббота",type_work:1},
      {id:7,name:"Воскресенье",type_work:1}
    ];
  }

  login(form:any){
      console.log(form);
  }

}
