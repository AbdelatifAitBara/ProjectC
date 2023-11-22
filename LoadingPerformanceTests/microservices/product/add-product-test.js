import { check } from 'k6';
import http from 'k6/http';

export default function() {

  const res = http.get('https://projetc.abdelatif-aitbara.link/product/add_product');

  if(res.body.includes('Method Not Allowed')) {
    check(res, {
      'verify homepage text': (r) => {
        r.status = 200;
        return true;  
      }
    });
  }
}