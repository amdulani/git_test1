import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HttpReqService } from 'src/app/services/http-req.service';

@Component({
  selector: 'app-inventory',
  templateUrl: './inventory.page.html',
  styleUrls: ['./inventory.page.scss'],
})
export class InventoryPage implements OnInit {

  products:any;

  constructor(public router: Router,
    private http: HttpReqService) { }

  

  ngOnInit() {

    this.getStores();
  }

  async getStores(){
    const reqParam = {
      endPoint: 'store.php',
      data: {
        action: 'read_all_item',
        session_id: 'ccgsmii941shj44qr4i940d5uo'
      }
    };

    const res: any = await this.http.httpReq('GET', reqParam);
    console.log(res.details);
    this.products=res.details;
  }

  addGoods(){
    this.router.navigate(['/add-goods']);
  }

}
