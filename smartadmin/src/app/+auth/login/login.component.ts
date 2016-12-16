import { Component, OnInit } from '@angular/core';
import {Router} from "@angular/router";
import {CookieService} from "angular2-cookie/services/cookies.service";
import {AuthService} from "../../shared/api/auth.service"

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html'
})

export class LoginComponent implements OnInit {
    
    public validationOptions: any = {
        messages: {
            email: {email: 'E-mail введен не корректно', required: 'Пожалуйста, введите почтовый ящик'},
            password: {required:'Пожалуйста, введите пароль'}
        }
    };
    
    constructor(private router: Router,
                private cookieService:CookieService,
                private authService:AuthService) { }

    ngOnInit() {
    }

    login(form:any){
        this.authService.login(form.value)
            .subscribe(
                data => {
                    if(data.s_error!==undefined){
                        $.smallBox({
                            title: "Ошибка авторизации",
                            content: "<i class='fa fa-clock-o'></i> <i>"+data.s_error+"</i>",
                            color: "#C46A69",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 4000
                        });
                    }else{
                        this.cookieService.put("token",data.token);
                        this.cookieService.putObject("user",{"roles":data.roles,"email":data.email});
                        this.router.navigate(['/home'])
                    }
                }
            );
    }

}
