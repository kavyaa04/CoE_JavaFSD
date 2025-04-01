// import { Component } from '@angular/core';

// @Component({
//   selector: 'app-root',
//   templateUrl: './app.component.html',
//   styleUrl: './app.component.css'
// })
// export class AppComponent {
//   title = 'ethical-hacking';
// }




import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from './services/auth.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  isLoggedIn = false;

  constructor(private authService: AuthService, private router: Router) {
    this.isLoggedIn = this.authService.isLoggedIn;   // ✅ Correct

  }

  toggleLogin() {
    if (this.isLoggedIn) {
      this.authService.logout();
      this.isLoggedIn = false;
      this.router.navigate(['/login']);
    } else {
      this.router.navigate(['/login']);
    }
  }
}
