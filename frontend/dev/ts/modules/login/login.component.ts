import { Component }        from '@angular/core';
import { Router }           from '@angular/router';
import { AuthService }      from '../../services/auth.service';
import { CookieService }    from 'angular2-cookie/services/cookies.service';
import { User }             from '../../objects/user';

@Component({
    templateUrl:'app/html/login.component.html',
    styleUrls:['app/css/login.component.css']
})


export class LoginComponent {
    message: string;
    email:string;
    password:string;
    error:string;
    auth:boolean;
    
    constructor(public authService: AuthService, public router: Router,private cookie:CookieService) {
        this.setMessage();
        this.auth = (authService.user===undefined) ? true:false;
    }
    
    setMessage() {
        this.message = (this.authService.user !==undefined ? 'Вы действительно хотите?' : 'Авторизация');
    }
    
    private setAuth(data:User){
        this.cookie.putObject("user",{
            id:data.id,
            email:data.email,
            token:data.token,
            org_id:data.org_id
        });
        
        window.location = "/shop";
    }
    
    login(){
        let email = document.getElementById('inputEmail').value;
        let password = document.getElementById('inputPassword').value;
        this.authService.login(email,password)
            .subscribe(
                data => {
                    if(data.error!==undefined){
                        this.error = data.error;
                    }else{
                        this.setAuth(data);
//                        let redirect = this.authService.redirectUrl ? this.authService.redirectUrl : '/shop';
                    }
                },
                error => console.log("Error: " + error)
            );
        return false;
    }
    
    logout() {
        this.authService.logout();
        this.setMessage();
    }
}
