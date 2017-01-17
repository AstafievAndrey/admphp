import { Component, OnInit } from '@angular/core';
import {ShopService} from "../../shared/api/shop.service";

@Component({
  templateUrl: '../html/shop.component.html',
})
export class ListShopComponent implements OnInit {

  constructor(public shopService:ShopService) {

  }

  ngOnInit() {
    this.shopService.listShop();
  }

}
