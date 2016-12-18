import { Component, OnInit } from '@angular/core';

@Component({
  templateUrl: '../html/formShop.component.html',
})
export class AddShopComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }

  login(form:any){
      console.log(1);
  }

}
