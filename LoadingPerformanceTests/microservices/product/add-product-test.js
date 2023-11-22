import { check } from 'k6';
import http from 'k6/http';


export const options = {
    vus: 100, 
    duration: '1m', 
  };


export default function () {
  const res = http.get('https://projetc.abdelatif-aitbara.link/product/add_product');
  check(res, {
    'Method Not Allowed': (r) => r.status === 200,
  });
}

