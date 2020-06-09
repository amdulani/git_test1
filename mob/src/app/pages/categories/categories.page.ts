import { Component, OnInit } from '@angular/core';
import { HttpReqService } from 'src/app/services/http-req.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-categories',
  templateUrl: './categories.page.html',
  styleUrls: ['./categories.page.scss'],
})
export class CategoriesPage implements OnInit {

  categories:any;

  constructor(public router: Router,
    private http: HttpReqService) { }

  ngOnInit() {
    
  }

  ionViewWillEnter(){
    this.getCategories();
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
}
