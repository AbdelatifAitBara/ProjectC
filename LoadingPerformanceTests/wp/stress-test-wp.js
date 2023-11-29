import http from 'k6/http';
import {sleep} from 'k6';

export const options = {
  // Key configurations for Stress in this section
  stages: [
    { duration: '2m', target: 30 },
    { duration: '5m', target: 70 }, 
    { duration: '2m', target: 0 }, 
  ],
};

export default () => {
  const urlRes = http.get('https://projetc.abdelatif-aitbara.link');
  sleep(1);
};

