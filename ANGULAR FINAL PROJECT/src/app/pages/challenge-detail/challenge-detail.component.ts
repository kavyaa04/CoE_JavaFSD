import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ChallengeService } from '../../services/challenge.service';
import { Challenge } from '../../model/challenge.model';
@Component({
  selector: 'app-challenge-detail',
  templateUrl: './challenge-detail.component.html',
  styleUrls: ['./challenge-detail.component.css']
})
export class ChallengeDetailComponent implements OnInit {
  challenge: any;

  constructor(private route: ActivatedRoute, private challengeService: ChallengeService) {}

  ngOnInit() {
    const id = this.route.snapshot.paramMap.get('id');
    this.challengeService.getChallenges().subscribe(challenges => {
      this.challenge = challenges.find((ch: Challenge) => ch.id === Number(id));

      
      

    });
  }
}



