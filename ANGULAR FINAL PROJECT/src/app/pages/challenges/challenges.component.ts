import { Component, OnInit } from '@angular/core';
import { ChallengeService } from '../../services/challenge.service';

@Component({
  selector: 'app-challenges',
  templateUrl: './challenges.component.html',
  styleUrls: ['./challenges.component.css']
})
export class ChallengesComponent implements OnInit {
  challenges: any[] = [];

  constructor(private challengeService: ChallengeService) {}

  ngOnInit() {
    this.challengeService.getChallenges().subscribe(
      data => {
        this.challenges = data;
        console.log("Challenges:", this.challenges);
      },
      error => console.error("Error loading challenges:", error)
    );
  }

  startChallenge(id: number) {
    console.log("Starting challenge with ID:", id);
    // Example: Navigate to challenge details page
    // this.router.navigate(['/challenge', id]);  // Uncomment if using Router
  }
}


