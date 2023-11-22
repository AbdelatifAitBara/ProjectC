import { check } from 'k6';
import http from 'k6/http';

export const options = {
    duration: '60s',
    thresholds: {
        http_req_failed: ['rate<0.01'], // http errors should be less than 1%
        http_req_duration: ['p(95)<200'], // 95% of requests should be below 200ms
    },
};

export default function () {
  const res = http.get('https://projetc.abdelatif-aitbara.link/product/add_product');
  const res2 = http.get('https://projetc.abdelatif-aitbara.link/product/get_product');
  const res3 = http.get('https://projetc.abdelatif-aitbara.link/product/update_product');
  const res4 = http.get('https://projetc.abdelatif-aitbara.link/product/delete_product');
  check(res, {
    'is status 200': (r) => r.status === 200,
  });
}