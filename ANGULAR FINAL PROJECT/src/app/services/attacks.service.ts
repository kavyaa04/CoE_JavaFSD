// import { Injectable } from '@angular/core';

// @Injectable({
//   providedIn: 'root'
// })
// export class AttacksService {

//   constructor() { }
// }


export const ATTACKS = [
  {
    id: 'sql-injection',
    title: 'SQL Injection',
    description: 'A code injection attack that allows attackers to manipulate databases using SQL queries.',
    usage: 'Used to bypass authentication, extract data, or delete records from a database.',
    how: 'Attackers inject malicious SQL queries into input fields.',
    who: 'Black-hat hackers, penetration testers.',
    prevention: 'Use prepared statements, parameterized queries, and input validation.',
    tools: ['SQLMap', 'Havij', 'jSQL Injection']
  },
  {
    id: 'xss',
    title: 'Cross-Site Scripting (XSS)',
    description: 'An attack where malicious scripts are injected into web pages viewed by users.',
    usage: 'Used to steal cookies, session tokens, and deface web pages.',
    how: 'Injecting JavaScript into vulnerable website input fields.',
    who: 'Cybercriminals, bug bounty hunters.',
    prevention: 'Sanitize inputs, use Content Security Policy (CSP), and escape outputs.',
    tools: ['Burp Suite', 'XSSer', 'BeEF']
  },
  {
    id: 'phishing',
    title: 'Phishing',
    description: 'A social engineering attack where attackers impersonate legitimate entities to steal sensitive information.',
    usage: 'Used to steal login credentials, financial data, and personal information.',
    how: 'Attackers send fake emails or create fake login pages to trick users.',
    who: 'Scammers, cybercriminals, identity thieves.',
    prevention: 'Verify email sources, use anti-phishing tools, and never click unknown links.',
    tools: ['PhishTank', 'Gophish', 'Zphisher']
  },
  {
    id: 'ransomware',
    title: 'Ransomware',
    description: 'A type of malware that encrypts files and demands a ransom for decryption.',
    usage: 'Used to extort money from individuals and organizations.',
    how: 'Malware is delivered via phishing emails or malicious downloads.',
    who: 'Cybercriminals, ransomware gangs.',
    prevention: 'Keep backups, update software, and avoid suspicious links.',
    tools: ['CryptoLocker', 'WannaCry', 'REvil']
  },
  {
    id: 'man-in-the-middle',
    title: 'Man-in-the-Middle (MITM)',
    description: 'An attack where a third party intercepts communication between two entities.',
    usage: 'Used to eavesdrop on private conversations or steal sensitive data.',
    how: 'Attackers position themselves between a user and a legitimate service.',
    who: 'Hackers, intelligence agencies, cybercriminals.',
    prevention: 'Use HTTPS, VPNs, and encrypted communication.',
    tools: ['Ettercap', 'Wireshark', 'SSLstrip']
  },
  {
    id: 'denial-of-service',
    title: 'Denial of Service (DoS/DDoS)',
    description: 'An attack that overwhelms a target server with excessive requests to make it unavailable.',
    usage: 'Used to disrupt business operations and make services inaccessible.',
    how: 'Attackers flood the target with excessive traffic or exploit vulnerabilities.',
    who: 'Hacktivists, competitors, cybercriminals.',
    prevention: 'Use firewalls, rate limiting, and DDoS protection services.',
    tools: ['LOIC', 'HOIC', 'Mirai Botnet']
  },
  {
    id: 'zero-day',
    title: 'Zero-Day Exploit',
    description: 'An attack that exploits an unknown software vulnerability before a patch is available.',
    usage: 'Used for espionage, cyber warfare, and targeted attacks.',
    how: 'Attackers find and exploit vulnerabilities before developers can fix them.',
    who: 'State-sponsored hackers, cybercriminals, security researchers.',
    prevention: 'Regular security updates, intrusion detection systems, and security audits.',
    tools: ['Metasploit', 'ExploitDB', 'Zerodium']
  },
  {
    id: 'brute-force',
    title: 'Brute Force Attack',
    description: 'A trial-and-error attack used to gain unauthorized access by guessing passwords.',
    usage: 'Used to break into user accounts and systems.',
    how: 'Attackers try multiple username-password combinations until they succeed.',
    who: 'Cybercriminals, ethical hackers, penetration testers.',
    prevention: 'Use strong passwords, 2FA, and account lockout policies.',
    tools: ['Hydra', 'John the Ripper', 'Aircrack-ng']
  },
  {
    id: 'password-spraying',
    title: 'Password Spraying',
    description: 'An attack where a few common passwords are tried against many accounts.',
    usage: 'Used to avoid detection by security systems while guessing passwords.',
    how: 'Attackers use common passwords across a large number of user accounts.',
    who: 'Cybercriminals, malicious insiders.',
    prevention: 'Use complex passwords, multi-factor authentication, and security monitoring.',
    tools: ['Fireforce', 'Burp Suite', 'Nmap']
  },
  {
    id: 'social-engineering',
    title: 'Social Engineering',
    description: 'An attack that manipulates people into giving away confidential information.',
    usage: 'Used to gain access to sensitive information or systems.',
    how: 'Attackers use deception, impersonation, or psychological manipulation.',
    who: 'Cybercriminals, scammers, corporate spies.',
    prevention: 'Security awareness training, identity verification, and monitoring.',
    tools: ['Maltego', 'Social Engineer Toolkit (SET)', 'OSINT Framework']
  },
  {
    id: 'malware',
    title: 'Malware',
    description: 'A broad term for malicious software designed to harm or exploit systems.',
    usage: 'Used for data theft, espionage, and system damage.',
    how: 'Delivered through email attachments, downloads, or malicious websites.',
    who: 'Hackers, cybercriminals, state-sponsored attackers.',
    prevention: 'Install antivirus software, avoid unknown downloads, and update regularly.',
    tools: ['VirusTotal', 'Malwarebytes', 'Kaspersky']
  },
  {
    id: 'session-hijacking',
    title: 'Session Hijacking',
    description: 'An attack where an attacker takes over a user’s active session.',
    usage: 'Used to impersonate a user and perform unauthorized actions.',
    how: 'Attackers steal session cookies or use network sniffing techniques.',
    who: 'Cybercriminals, penetration testers.',
    prevention: 'Use HTTPS, secure session tokens, and logout mechanisms.',
    tools: ['Burp Suite', 'Ettercap', 'Firesheep']
  },
  {
    id: 'dns-spoofing',
    title: 'DNS Spoofing',
    description: 'An attack that redirects users to malicious websites by altering DNS records.',
    usage: 'Used to steal login credentials, install malware, or commit fraud.',
    how: 'Attackers poison the DNS cache or manipulate DNS responses.',
    who: 'Cybercriminals, government agencies, security researchers.',
    prevention: 'Use DNSSEC, encrypted DNS, and avoid public Wi-Fi.',
    tools: ['dnsspoof', 'Bettercap', 'Scapy']
  },
  {
    id: 'eavesdropping',
    title: 'Eavesdropping Attack',
    description: 'An attack where unauthorized parties listen to private communications.',
    usage: 'Used for intelligence gathering, espionage, and personal data theft.',
    how: 'Attackers intercept unencrypted network traffic.',
    who: 'Hackers, intelligence agencies, corporate spies.',
    prevention: 'Use encrypted communication, VPNs, and secure network protocols.',
    tools: ['Wireshark', 'tcpdump', 'Kismet']
  }
];
