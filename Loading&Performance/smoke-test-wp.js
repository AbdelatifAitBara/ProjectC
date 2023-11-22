import http from 'k6/http';
import { check, sleep} from 'k6';

export const options = {
  vus: 5, // Key for Smoke test.
  duration: '1m',
  thresholds: {
    http_req_failed: ['rate<0.01'], // http errors should be less than 1%
},
};

export default () => {
  const urlRes = http.get('https://projetc.abdelatif-aitbara.link/');
  sleep(1);
};