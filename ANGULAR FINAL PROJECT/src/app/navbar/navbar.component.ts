// import { Component } from '@angular/core';
// import { Router } from '@angular/router';
// import { AuthService } from '../services/auth.service';

// @Component({
//   selector: 'app-navbar',
//   templateUrl: './navbar.component.html',
//   styleUrls: ['./navbar.component.css'],
// })
// export class NavbarComponent {
//   isLoggedIn = false;

//   constructor(private authService: AuthService, private router: Router) {
//     this.isLoggedIn = this.authService.isLoggedIn();
//   }

//   // ✅ Added function to check leaderboard access
//   checkLeaderboardAccess(event: Event) {
//     event.preventDefault(); // Prevent default link behavior
//     if (this.authService.isLoggedIn()) {
//       this.router.navigate(['/leaderboard']);
//     } else {
//       alert('Please login first!');
//     }
//   }

//   // ✅ Added function to handle login/logout
//   handleAuth() {
//     if (this.authService.isLoggedIn()) {
//       this.authService.logout();
//       this.isLoggedIn = false;
//       this.router.navigate(['/login']);
//     } else {
//       this.router.navigate(['/login']);
//     }
//   }
// }

import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css'],
})
export class NavbarComponent {
  isLoggedIn: boolean = false;

  constructor(private authService: AuthService, private router: Router) {}

  ngOnInit() {
    this.isLoggedIn = this.authService.isLoggedIn;
  }

  handleAuth() {
    if (this.authService.isLoggedIn) {
      this.authService.logout();
      this.isLoggedIn = false;
      this.router.navigate(['/login']);
    } else {
      this.router.navigate(['/login']);
    }
  }

  checkLeaderboardAccess(event: Event) {
    event.preventDefault();
    if (this.authService.isLoggedIn) {
      this.router.navigate(['/leaderboard']);
    } else {
      alert('You need to log in to access the leaderboard.');
      this.router.navigate(['/login']);
    }
  }
}
