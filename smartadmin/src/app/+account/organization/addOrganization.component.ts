import { Component, OnInit } from '@angular/core';
import {OrganizationService} from "../../shared/api/organization.service";

declare var $:any;

@Component({
    selector: 'app-account-organization',
    templateUrl: 'html/formOrganization.component.html',
})

export class AddOrganizationComponent implements OnInit {

    disabled:boolean = false;

    constructor(public organizationService:OrganizationService) {
        this.organizationService.emptyOrganization();
    }

    public validationOptions: any = {
        messages: {
            name: {required: 'Пожалуйста, заполните обязательное поле'},
            address: {required: 'Пожалуйста, заполните обязательное поле'},
            phone: {required: 'Пожалуйста, заполните обязательное поле'},
            email: {required: 'Пожалуйста, заполните обязательное поле'},
        }
    };

    ngOnInit() {
    }

    sendForm(){
        this.disabled = true;
        this.organizationService.addOrganization().subscribe(
            data=>{
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
                    this.organizationService.emptyOrganization();
                }
                this.disabled = false;
            }
        );
    }

}
