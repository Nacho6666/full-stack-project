import { Component, Input } from '@angular/core';
import { ButtonsComponent } from '../buttons/buttons.component';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [ButtonsComponent],
  templateUrl: './header.component.html',
  styleUrl: './header.component.css'
})
export class HeaderComponent {
  componentToShow: string = "login"

  showComponent(componentToShow: string): void {
    this.componentToShow = componentToShow;
  }

  @Input() pageTitle!: string;
  @Input() logoSrc!: string;
}
