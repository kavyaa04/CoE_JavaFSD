import { Component, OnInit } from '@angular/core';
import { ChallengeService } from '../../services/challenge.service';

@Component({
  selector: 'app-challenge-list',
  templateUrl: './challenge-list.component.html',
  styleUrls: ['./challenge-list.component.css']
})
export class ChallengeListComponent implements OnInit {
  challenges: any[] = [];

  constructor(private challengeService: ChallengeService) {}

  ngOnInit() {
    this.challengeService.getChallenges().subscribe(data => {
      this.challenges = data;
    });
  }
}
