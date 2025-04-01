// import { NgModule } from '@angular/core';
// import { RouterModule, Routes } from '@angular/router';
// import { HomeComponent } from './pages/home/home.component';
// import { LoginComponent } from './pages/login/login.component';
// import { ChallengesComponent } from './pages/challenges/challenges.component';
// //import { ChallengeDetailComponent } from './pages/challenge-detail/challenge-detail.component';
// import { ChallengeDetailComponent } from './pages/challenge-detail/challenge-detail.component';
// import { LeaderboardComponent } from './pages/leaderboard/leaderboard.component';
// import { LearnComponent } from './pages/learn/learn.component';

// import { AuthGuard } from './guards/auth.guard';

// const routes: Routes = [
//   { path: '', component: HomeComponent },
//   { path: 'login', component: LoginComponent },
//   { path: 'challenges', component: ChallengesComponent },
//   { path: 'challenge/:id', component: ChallengeDetailComponent },
//   { path: 'leaderboard', component: LeaderboardComponent },
//   { path: 'learn', component: LearnComponent },
//   { path: '**', redirectTo: '' } // Redirect unknown routes to Home

// ];

// @NgModule({
//   imports: [RouterModule.forRoot(routes)],  // ✅ Pass the 'routes' array
//   exports: [RouterModule]
// })
// export class AppRoutingModule { }







import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { LoginComponent } from './pages/login/login.component';
import { ChallengesComponent } from './pages/challenges/challenges.component';
import { ChallengeDetailComponent } from './pages/challenge-detail/challenge-detail.component';
import { LeaderboardComponent } from './pages/leaderboard/leaderboard.component';
import { LearnComponent } from './pages/learn/learn.component';
import { AuthGuard } from './guards/auth.guard';

const routes: Routes = [
  { path: '', component: HomeComponent},
  { path: 'login', component: LoginComponent },
  { path: 'challenges', component: ChallengesComponent},
  { path: 'challenge/:id', component: ChallengeDetailComponent},
  { path: 'leaderboard', component: LeaderboardComponent, canActivate: [AuthGuard] },

  { path: 'learn', component: LearnComponent},
  { path: '**', redirectTo: '' } // Redirect unknown routes to Home
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],  
  exports: [RouterModule]
})
export class AppRoutingModule { }
