import { NgModule } from "@angular/core";
import { RouterModule } from "@angular/router";
import { SignUpComponent } from "./pages/sign-up/sign-up.component";

const routes = [
  {
    path: '',
    component: SignUpComponent,
    data: {
      title: 'Sign up'
    }
  }
];

@NgModule({
  imports: [
    RouterModule.forChild(routes),
  ],
  exports: [RouterModule]
})
export class UserRoutingModule {}
