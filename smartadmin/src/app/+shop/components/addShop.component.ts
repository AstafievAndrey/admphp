import { Component, OnInit } from '@angular/core';
import {CookieService} from "angular2-cookie/services/cookies.service";
import {ShopService} from "../../shared/api/shop.service";
import {CategoryService} from "../../shared/api/category.service";
import {CityService} from "../../shared/api/city.service";
import {OrganizationService} from "../../shared/api/organization.service";

declare var $:any;

@Component({
  templateUrl: '../html/formShop.component.html',
})
export class AddShopComponent implements OnInit {

    shedule:any[];
    numbers:number[];
    user:any;
    disabled:boolean = false;

    constructor(
        private cookieService:CookieService,
        private shopService:ShopService,
        private categoryService:CategoryService,
        private cityService:CityService,
        private organizationService:OrganizationService,
    ) {
        this.user = this.cookieService.getObject("user");
    }

    ngOnInit() {
        this.categoryService.getCategories(1);
        this.cityService.getCities();
        if (this.user.admin == true) this.organizationService.getOrganizations();
        this.numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24];
        this.shedule = [
          {id:1,name:"Понедельник",type_work:"1"},
          {id:2,name:"Вторник",type_work:"1"},
          {id:3,name:"Среда",type_work:"1"},
          {id:4,name:"Четверг",type_work:"1"},
          {id:5,name:"Пятница",type_work:"1"},
          {id:6,name:"Суббота",type_work:"1"},
          {id:7,name:"Воскресенье",type_work:"1"}
        ];
    }

    sendForm(form:any){
        this.disabled = true;
        this.shopService.addShop(form)
          .subscribe(
              data => {
                  if(data.s_error != undefined){
                      $.smallBox({
                          title: "Ошибка",
                          content: "<i class='fa fa-clock-o'></i> <i>"+data.s_error+"</i>",
                          color: "#C46A69",
                          iconSmall: "fa fa-check fa-2x fadeInRight animated",
                          timeout: 4000
                      });
                  }
                  this.disabled = false;
              }
          );
    }

}
