import { Component } from '@angular/core';
import './rxjs-operators';

import { AuthService } from './services/auth.service';

@Component({
    selector: 'my-app',
    templateUrl:'app/html/app.component.html'
})

export class AppComponent { 
    
    constructor(public authService: AuthService){
//        console.log(authService.user);
    }
    
}
