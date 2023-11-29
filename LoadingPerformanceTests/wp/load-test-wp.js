import http from 'k6/http';
import {sleep} from 'k6';

export const options = {
  // Key configurations for avg load test in this section
  stages: [
    { duration: '2m', target: 20 }, 
    { duration: '8m', target: 50 }, 
    { duration: '3m', target: 0 }, 
  ],

};

export default () => {
  const urlRes = http.get('https://projetc.abdelatif-aitbara.link');
  sleep(1);
};
