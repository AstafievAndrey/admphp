import { Component, OnInit } from '@angular/core';
import {OrganizationService} from "../../shared/api/organization.service";

@Component({
    selector: 'app-account-organization',
    templateUrl: 'html/organization.component.html',
})
export class OrganizationComponent implements OnInit {

    constructor(public organizationService:OrganizationService) { }

    ngOnInit() {
        this.organizationService.getOrganizations();
    }

}
