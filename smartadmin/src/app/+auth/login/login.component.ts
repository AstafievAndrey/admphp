import { Component, OnInit } from '@angular/core';
import {Router} from "@angular/router";

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
    
    constructor(private router: Router) { }

    ngOnInit() {
    }

    login(form:any){
        event.preventDefault();
        console.log(form);
  //    this.router.navigate(['/dashboard/analytics'])
    }

}
