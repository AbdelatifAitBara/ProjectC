import http from 'k6/http';
import { check, sleep} from 'k6';

export const options = {
  vus: 5, // Key for Smoke test.
  duration: '1m',
};

export default () => {
  const urlRes = http.get('https://projetc.abdelatif-aitbara.link/');
  sleep(1);
};