import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ChallengeService {
  private jsonUrl = 'assets/data.json'; // Ensure file exists

  constructor(private http: HttpClient) {}

  getChallenges(): Observable<any> {
    return this.http.get(this.jsonUrl);
  }
}
