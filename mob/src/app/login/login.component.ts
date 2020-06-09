import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnInit {
  username: string;
  password: string;
  constructor(public navCtrl: NavController) { 

  }

  ngOnInit() {}

  login() {
    console.log("Username: " + this.username);

    console.log("Password: " + this.password);
  }

}
