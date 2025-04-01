// import { Component } from '@angular/core';

// @Component({
//   selector: 'app-leaderboard',
//   templateUrl: './leaderboard.component.html',
//   styleUrls: ['./leaderboard.component.css']
// })
// export class LeaderboardComponent {
//   leaderboard = [
//     { username: 'HackerX', score: 9800 },
//     { username: 'CyberNinja', score: 8700 },
//     { username: 'DarkWebWarrior', score: 8500 },
//     { username: 'RootUser', score: 7900 },
//     { username: 'PentestPro', score: 7500 }
//   ];
// }





import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-leaderboard',
  templateUrl: './leaderboard.component.html',
  styleUrls: ['./leaderboard.component.css']
})
export class LeaderboardComponent implements OnInit {
  leaderboard = [
    { username: 'HackerX', score: 9800 },
    { username: 'CyberNinja', score: 8700 },
    { username: 'DarkWebWarrior', score: 8500 },
    { username: 'RootUser', score: 7900 },
    { username: 'PentestPro', score: 7500 }
  ];

  welcomeMessage: string = '';
  user: string | null = null;

  constructor(private authService: AuthService, private router: Router, private route: ActivatedRoute) {}

  ngOnInit() {
    this.user = this.authService.getUser();  // ✅ Call it as a method

    
    if (!this.user) {
      this.router.navigate(['/login'], { queryParams: { message: 'First log in!' } });
    } else {
      this.welcomeMessage = `Welcome, ${this.user}!`;
    }
  }
}
