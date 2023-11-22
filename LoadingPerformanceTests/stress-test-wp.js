import http from 'k6/http';
import {sleep} from 'k6';

export const options = {
  // Key configurations for Stress in this section
  stages: [
    { duration: '5m', target: 50 },
    { duration: '10m', target: 100 }, 
    { duration: '5m', target: 0 }, 
  ],
  thresholds: {
    http_req_failed: ['rate<0.01'], // http errors should be less than 1%
  },
};

export default () => {
  const urlRes = http.get('https://projetc.abdelatif-aitbara.link');
  sleep(1);
};

