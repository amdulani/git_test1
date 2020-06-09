import { Component, OnInit } from "@angular/core";

@Component({
  selector: "app-sales",
  templateUrl: "./sales.page.html",
  styleUrls: ["./sales.page.scss"],
})
export class SalesPage implements OnInit {
  constructor() {}

  goodList: any = [
    {
      item: "Marie",
      cost: 40.0,
      qty: 200,
      net: 120,
    },
    {
      item: "Bun",
      cost: 40.0,
      qty: 6,
      net: 240,
    },
    {
      item: "Tea",
      cost: 60.0,
      qty: 5,
      net: 300,
    },
    {
      item: "Milk",
      cost: 50.0,
      qty: 10,
      net: 500,
    },
  ];
  public total:number =0;
// disabled = false;
  charge() {
    this.total = 0;
    this.goodList.forEach((a) => (this.total += a.net));
    //this.disabled = true;
    //console.log(this.total);
  }

  ngOnInit() {}
}


