import { Component, OnInit } from '@angular/core';
import { BarcodeScanner } from '@ionic-native/barcode-scanner/ngx';
import { HttpReqService } from 'src/app/services/http-req.service';


@Component({
  selector: 'app-add-goods',
  templateUrl: './add-goods.page.html',
  styleUrls: ['./add-goods.page.scss'],
})
export class AddGoodsPage implements OnInit {

  constructor(private barcodeScanner: BarcodeScanner,
    private http: HttpReqService) { }

  barcodeData:any;
  suppliers:any;
  categories:any;

  ngOnInit() {
    
  }

  ionViewWillEnter(){
    this.getSuppliers();
    this.getCategories();
  }

  scanCode(){
    this.barcodeScanner.scan().then(barcodeData => {
      this.barcodeData=barcodeData.text;
      console.log('Barcode data', barcodeData);
     }).catch(err => {
      this.barcodeData="00121345678";
         console.log('Error', err);
     });
  }

  logForm(form){
    console.log(form.value);
  }

  async getCategories(){
    const reqParam = {
      endPoint: 'store.php',
      data: {
        action: 'read',
        session_id: 'ccgsmii941shj44qr4i940d5uo'
      }
    };

    const res: any = await this.http.httpReq('GET', reqParam);
    console.log(res.details);
    this.categories=res.details;
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
