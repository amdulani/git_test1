import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';
import { InventoryPage } from './pages/inventory/inventory.page';
import { LoginComponent } from './login/login.component';

const routes: Routes = [
  {
    //path: '',redirectTo: 'sales',pathMatch: 'full'
    path: '',redirectTo: 'dashboard',pathMatch: 'full'
  },
  {
    path: 'login',
    component : LoginComponent
  },
  {
    path: 'home',
    loadChildren: () => import('./home/home.module').then( m => m.HomePageModule)
  },
  {
    path: 'add-goods',
    loadChildren: () => import('./pages/add-goods/add-goods.module').then( m => m.AddGoodsPageModule)
  },
  {
    path: 'sales',
    loadChildren: () => import('./pages/sales/sales.module').then( m => m.SalesPageModule)
  },
  {
    path: 'dashboard',
    loadChildren: () => import('./pages/dashboard/dashboard.module').then( m => m.DashboardPageModule)
  },
  {
    path: 'inventory',
    children:[
      {path:'',loadChildren: () => import('./pages/inventory/inventory.module').then( m => m.InventoryPageModule)},
      {
        path: 'categories',
        loadChildren: () => import('./pages/categories/categories.module').then( m => m.CategoriesPageModule)
      },
      {
        path: 'suppliers',
        loadChildren: () => import('./pages/suppliers/suppliers.module').then( m => m.SuppliersPageModule)
      },
      // {
      //   path: 'all-items',
      //   loadChildren: () => import('./pages/all-items/all-items.module').then( m => m.AllItemsPageModule)
      // }
    ] 
  },
  {
    path: 'dashboard',
    loadChildren: () => import('./pages/dashboard/dashboard.module').then( m => m.DashboardPageModule)
  },

  

];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
