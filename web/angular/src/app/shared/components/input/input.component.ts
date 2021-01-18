import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-input',
  templateUrl: './input.component.html',
  styleUrls: ['./input.component.scss'],
})
export class InputComponent implements OnInit {
  @Input() icon: string = '';
  @Input() name: string = '';
  @Input() type: string = 'text';
  @Input() placeholder: string = '';

  public focus: string = '';

  constructor() {}

  ngOnInit(): void {}

  onFocus($event: any) {
    console.log($event);
    this.focus = 'on-focus';
  }
}
