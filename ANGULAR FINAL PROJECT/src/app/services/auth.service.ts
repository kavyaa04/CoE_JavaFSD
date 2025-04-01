import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  private validUsers = [
    { username: 'admin', password: 'admin123' },
    { username: 'user', password: 'user123' }
  ];

  login(username: string, password: string): boolean {
    console.log(`🔍 Checking login for username: "${username}" and password: "${password}"`);

    const user = this.validUsers.find(u => u.username === username && u.password === password);

    if (user) {
      console.log(`✅ Login successful for "${username}"`);
      localStorage.setItem('isLoggedIn', 'true');
      localStorage.setItem('user', username);
      return true;
    }

    console.log(`❌ Invalid credentials for "${username}"`);
    return false;
  }

  logout(): void {
    console.log('🔴 Logging out...');
    localStorage.removeItem('isLoggedIn');
    localStorage.removeItem('user');
  }

  get isLoggedIn(): boolean {
    const status = localStorage.getItem('isLoggedIn') === 'true';
    console.log(`🟢 Auth Status: ${status}`);
    return status;
  }

  getUser(): string | null {
    return localStorage.getItem('user');
  }
}





















