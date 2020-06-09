import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HttpReqService } from 'src/app/services/http-req.service';

@Component({
  selector: 'app-suppliers',
  templateUrl: './suppliers.page.html',
  styleUrls: ['./suppliers.page.scss'],
})
export class SuppliersPage implements OnInit {

  suppliers:any;

  constructor(public router: Router,
    private http: HttpReqService) { }

  ngOnInit() {
    // this.getSuppliers();
  }

  ionViewWillEnter(){
    this.getSuppliers();
  }

  async getSuppliers(){
    const reqParam = {
      endPoint: 'store.php',
      data: {
        action: 'read_supplier',
        session_id: 'ccgsmii941shj44qr4i940d5uo'
      }
    };

    const res: any = await this.http.httpReq('GET', reqParam);
    console.log(res.details);
    this.suppliers=res.details;
  }
}
