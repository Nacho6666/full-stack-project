import { Component } from '@angular/core';
import { WelcomeContentComponent } from '../welcome-content/welcome-content.component';
import { LoginFormComponent } from '../login-form/login-form.component';
import { AxiosService } from '../axios.service';
import { ButtonsComponent } from "../buttons/buttons.component";
import { AuthContentComponent } from "../auth-content/auth-content.component";
import { CommonModule } from '@angular/common';
import { response } from 'express';

@Component({
    selector: 'app-content',
    standalone: true,
    templateUrl: './content.component.html',
    styleUrl: './content.component.css',
    imports: [WelcomeContentComponent, LoginFormComponent, AuthContentComponent, CommonModule]
})
export class ContentComponent {

  componentToShow: string = "login"

  constructor(private axiosService: AxiosService) {}

  showComponent(componentToShow: string): void {
    this.componentToShow = componentToShow;
  }

  onLogin(input: any) {
    this.axiosService.request(
        "POST",
        "/login",
        {
          login: input.login,
          password: input.password
        }
      ).then( response => {
        this.axiosService.setAuthToken(response.data.token);
        this.componentToShow = "messages";
      })
  }

  onRegister(input: any) {
    this.axiosService.request(
        "POST",
        "/register",
        {
          firstName: input.firstName,
          lastName: input.lastName,
          login: input.login,
          password: input.password
        }
      ).then( response => {
        this.axiosService.setAuthToken(response.data.token);
        this.componentToShow = "messages";
      })
  }
}
