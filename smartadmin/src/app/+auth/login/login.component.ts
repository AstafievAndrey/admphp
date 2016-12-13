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
        event.preventDefault();
        console.log(form);
        this.cookieService.put("token","test");
        console.log(this.cookieService.get("token"));
        this.authService.login(form.value)
            .subscribe(
                data => {
                    console.log(data);
                }
            );
  //    this.router.navigate(['/dashboard/analytics'])
    }

}
