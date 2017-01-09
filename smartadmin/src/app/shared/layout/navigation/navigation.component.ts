import {Component, OnInit} from '@angular/core';
import {CookieService} from "angular2-cookie/services/cookies.service";
import {LoginInfoComponent} from "../../user/login-info/login-info.component";


@Component({

  selector: 'sa-navigation',
  templateUrl: 'navigation.component.html'
})
export class NavigationComponent implements OnInit {

  user:any;

  constructor(private cookieService:CookieService) {
    this.user = this.cookieService.getObject("user");
  }

  ngOnInit() {
  }

}
