import http from 'k6/http';
import {sleep} from 'k6';

export const options = {
    // Key configurations for Soak test in this section
    stages: [
        { duration: '5m', target: 10 }, 
        { duration: '10m', target: 70 }, 
        { duration: '5m', target: 0 }, 
    ],

};

export default () => {
    const urlRes = http.get('https://projetc.abdelatif-aitbara.link');
    sleep(1);
};

