import { Component, OnInit } from '@angular/core';
import {UserService} from "../../shared/api/user.service";

@Component({
    selector: 'app-account-organization',
    templateUrl: './html/user.component.html',
})
export class UserComponent implements OnInit {

    constructor(public userService:UserService) { }

    ngOnInit() {
        this.userService.getUsers();
    }

}
