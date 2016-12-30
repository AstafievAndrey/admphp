import {Component, OnInit} from '@angular/core';
import {CookieService} from "angular2-cookie/services/cookies.service";
import {ShopService} from "../../shared/api/shop.service";
import {CategoryService} from "../../shared/api/category.service";
import {CityService} from "../../shared/api/city.service";
import {OrganizationService} from "../../shared/api/organization.service";
import {ActivatedRoute, Params} from "@angular/router";

declare var $:any;

@Component({
  templateUrl: '../html/formShop.component.html',
})
export class EditShopComponent implements OnInit {

    user:any;
    disabled:boolean = false;
    public validationOptions: any = {
        messages: {
            name: {required: 'Пожалуйста, заполните обязательное поле'},
            address: {required: 'Пожалуйста, заполните обязательное поле'},
            phone: {required: 'Пожалуйста, заполните обязательное поле'},
            short_desc: {required: 'Пожалуйста, заполните обязательное поле'},
            city_id: {required: 'Пожалуйста, заполните обязательное поле'},
            category_id: {required: 'Пожалуйста, заполните обязательное поле'},
        }
    };

    constructor(
        private cookieService:CookieService,
        private shopService:ShopService,
        private categoryService:CategoryService,
        private cityService:CityService,
        private organizationService:OrganizationService,
        private route: ActivatedRoute
    ) {

        this.user = this.cookieService.getObject("user");
        if(this.user.admin == true){
            this.validationOptions.messages.seo_translit = {required: 'Пожалуйста, заполните обязательное поле'};
            this.validationOptions.messages.seo_title = {required: 'Пожалуйста, заполните обязательное поле'};
            this.validationOptions.messages.seo_desc = {required: 'Пожалуйста, заполните обязательное поле'};
            this.validationOptions.messages.seo_keys = {required: 'Пожалуйста, заполните обязательное поле'};
            this.validationOptions.messages.org_id = {required: 'Пожалуйста, заполните обязательное поле'};
        }

    }

    ngOnInit() {
        this.shopService.emptyShop();
        this.route.params.forEach((params:Params)=>{
            this.shopService.getShop(params['id']).subscribe(
                data =>{
                    if(data.s_error != undefined){
                        $.smallBox({
                            title: "Ошибка",
                            content: "<i class='fa fa-clock-o'></i> <i>"+data.s_error+"</i>",
                            color: "#C46A69",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 4000
                        });
                    }else{
                        console.log(data);
                        this.shopService.shop = data;
                    }
                }
            );
        });
        this.categoryService.getCategories(1);
        this.cityService.getCities();
        if (this.user.admin == true) this.organizationService.getOrganizations();
    }

    sendForm(){
        this.disabled = true;
        this.shopService.editShop(this.shopService.shop)
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
                    }else{
                        $.smallBox({
                            title: "Сохранено",
                            content: "<i class='fa fa-clock-o'></i> <i>Запись добавлена в бд.</i>",
                            color: "#3c763d",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 4000
                        });
                    }
                    this.disabled = false;
                }
            );
    }

}
