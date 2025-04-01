





// import { Injectable } from '@angular/core';
// import { CanActivate, Router } from '@angular/router';

// @Injectable({
//   providedIn: 'root'
// })
// export class AuthGuard implements CanActivate {
//   constructor(private router: Router) {}

//   canActivate(): boolean {
//     const isAuthenticated = localStorage.getItem('user') === 'true';
//     if (!isAuthenticated) {
//       this.router.navigate(['/login']);
//       return false;
//     }
//     return true;
//   }
// }




import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Injectable({
  providedIn: 'root',
})
export class AuthGuard implements CanActivate {
  constructor(private authService: AuthService, private router: Router) {}

  canActivate(): boolean {
    if (this.authService.isLoggedIn) {  // ✅ Correct check
      return true;
    } else {
      alert('Please log in first!');
      this.router.navigate(['/login']);
      return false;
    }
  }
}

