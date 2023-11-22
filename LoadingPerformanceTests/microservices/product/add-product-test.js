import http from 'k6/http';


export default function() {


  http.setResponseCallback(http.expectedStatuses(405));
  const res = http.get('https://projetc.abdelatif-aitbara.link/product/add_product');

  if(res.body.includes('Method Not Allowed')) {
    check(res, {
      'verify homepage text': (r) => {
        return true;  
      }
    });
  }
}