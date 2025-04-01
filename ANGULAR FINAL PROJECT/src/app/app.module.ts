import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module'; 
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { HomeComponent } from './pages/home/home.component';
import { LoginComponent } from './pages/login/login.component';
import { ChallengesComponent } from './pages/challenges/challenges.component';
import { ChallengeDetailComponent } from './pages/challenge-detail/challenge-detail.component';
import { LeaderboardComponent } from './pages/leaderboard/leaderboard.component';
import { LearnComponent } from './pages/learn/learn.component';
import { NavbarComponent } from './navbar/navbar.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    LoginComponent,
    ChallengesComponent,
    ChallengeDetailComponent,
    LeaderboardComponent,
    LearnComponent,
    NavbarComponent,
    
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,  
    FormsModule,
    HttpClientModule,  
    RouterModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
