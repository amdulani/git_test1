import { Component, OnInit, ViewChild } from "@angular/core";
import { Router } from "@angular/router";
import { IonSlide, IonSlides } from '@ionic/angular';

@Component({
  selector: "app-dashboard",
  templateUrl: "./dashboard.page.html",
  styleUrls: ["./dashboard.page.scss"],
})
export class DashboardPage implements OnInit {


  @ViewChild('slideWithNav', { static: false }) slideWithNav: IonSlide;
 /*  @ViewChild('slideWithNav2', { static: false }) slideWithNav2: IonSlides;
  @ViewChild('slideWithNav3', { static: false }) slideWithNav3: IonSlides;
 */
  //sliderOne: any;
  sliderTwo: any;
 // sliderThree: any;

   //Configuration for each Slider
   /* slideOptsOne = {
    initialSlide: 0,
    slidesPerView: 1,
    centeredSlides: true,
    autoplay: true
  }; */
  slideOptsTwo = {
    initialSlide: 1,
    slidesPerView: 2,
    loop: true,
   
    spaceBetween: 12
  };
 /*  slideOptsThree = {
    initialSlide: 0,
    slidesPerView: 3
  }; */

  constructor(private router: Router) {
 //Item object for Nature
 /* this.sliderOne =
 {
   isBeginningSlide: true,
   isEndSlide: false,
   slidesItems: [
     {
       id: 995
     },
     {
       id: 925
     },
    
   ]
 }; */
 //Item object for Food
 this.sliderTwo =
 {
   isBeginningSlide: true,
   isEndSlide: false,
   slidesItems:  [
     {
       id: 324,
       title: "Monthly Overview",
       sales: 795542,
       profit: 690500
     },
      {
       id: 321,
       title: "Daily Overview",
       sales: 795542,
       profit: 690500
     },
     
   ]
 };
 //Item object for Fashion
 /* this.sliderThree =
 {
   isBeginningSlide: true,
   isEndSlide: false,
   slidesItems: [
     {
       id: 643
     },
     {
       id: 532
     },
   
   ]
 }; */

}

  //Move to Next slide
  slideNext(object, slideView) {
    slideView.slideNext(500).then(() => {
      this.checkIfNavDisabled(object, slideView);
    });
  }

  //Move to previous slide
  slidePrev(object, slideView) {
    slideView.slidePrev(500).then(() => {
      this.checkIfNavDisabled(object, slideView);
    });;
  } 

  //Method called when slide is changed by drag or navigation
  SlideDidChange(object, slideView) {
    this.checkIfNavDisabled(object, slideView);
  }

  //Call methods to check if slide is first or last to enable disbale navigation  
  checkIfNavDisabled(object, slideView) {
    this.checkisBeginning(object, slideView);
    this.checkisEnd(object, slideView);
  }

  checkisBeginning(object, slideView) {
    slideView.isBeginning().then((istrue) => {
      object.isBeginningSlide = istrue;
    });
  }
  checkisEnd(object, slideView) {
    slideView.isEnd().then((istrue) => {
      object.isEndSlide = istrue;
    });
  }

  ngOnInit() {}
}
