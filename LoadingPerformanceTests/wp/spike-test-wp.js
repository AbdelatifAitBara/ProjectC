import http from 'k6/http';
import {sleep} from 'k6';

export const options = {
    // Key configurations for spike in this section
    stages: [
        { duration: '2m', target: 50 }, // fast ramp-up to a high point
        // No plateau
        { duration: '1m', target: 0 }, // quick ramp-down to 0 users
    ],
    thresholds: {
        http_req_failed: ['rate<0.01'], // http errors should be less than 1%
    },
};

export default () => {
    const urlRes = http.get('https://projetc.abdelatif-aitbara.link');
    sleep(1);
};
