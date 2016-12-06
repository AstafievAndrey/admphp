import { Component, OnInit } from '@angular/core';
import {Router} from "@angular/router";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html'
})

export class LoginComponent implements OnInit {
    
    email:string;
    pass:string;
    
    constructor(private router: Router) { }

    ngOnInit() {
    }

    login(event){
        event.preventDefault();
        console.log(this.email,this.pass);
  //    this.router.navigate(['/dashboard/analytics'])
    }

}
