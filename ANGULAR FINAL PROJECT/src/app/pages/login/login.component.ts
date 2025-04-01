import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  username: string = '';
  password: string = '';

  constructor(private authService: AuthService, private router: Router) {}

  async onLogin(): Promise<void> {
    this.username = this.username.trim();
    this.password = this.password.trim();

    console.log(`👤 Input Username: "${this.username}", Password: "${this.password}"`);

    if (!this.username || !this.password) {
      alert('Please enter a valid username and password.');
      return;
    }

    try {
      const loginSuccess = await this.authService.login(this.username, this.password);

      if (loginSuccess) {
        console.log('✅ Redirecting to leaderboard');
        this.router.navigate(['/leaderboard']);
      } else {
        console.log('❌ Invalid login attempt');
        alert('Invalid username or password!');
      }
    } catch (error) {
      console.error('⚠️ Login error:', error);
      alert('An error occurred during login. Please try again.');
    }
  }
}






