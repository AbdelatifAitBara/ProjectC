import { check } from 'k6';
import http from 'k6/http';

export const options = {
  vus: 100, 
  duration: '1m', 
};

export default function () {
  http.setResponseCallback(http.expectedStatuses(405));
  const res = http.get('https://projetc.abdelatif-aitbara.link/order/delete_order/01');
  check(res, {
    'verify homepage text': (r) =>
      r.body.includes('Method Not Allowed'),
  });
}
