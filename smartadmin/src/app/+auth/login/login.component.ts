import { Component, OnInit } from '@angular/core';
import {Router} from "@angular/router";
import {AuthService} from "../../shared/api/auth.service";

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
    
    constructor(private router: Router,private authService: AuthService) { }

    ngOnInit() {
    }

    login(form:any){
        event.preventDefault();
        console.log(form);
        this.authService.login(form.value)
            .subscribe(
                data => {
                    console.log(data);
                }
            );
  //    this.router.navigate(['/dashboard/analytics'])
    }

}
