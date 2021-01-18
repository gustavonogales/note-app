import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ButtonComponent } from './components/button/button.component';
import { FeatherModule } from 'angular-feather';
import { ChevronLeft, User, Mail, Lock } from 'angular-feather/icons';
import { InputComponent } from './components/input/input.component';

const icons = {
  ChevronLeft,
  User,
  Mail,
  Lock,
};

@NgModule({
  declarations: [ButtonComponent, InputComponent],
  imports: [FeatherModule.pick(icons), CommonModule],
  exports: [ButtonComponent, FeatherModule, InputComponent],
})
export class SharedModule {}
