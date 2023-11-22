import http from 'k6/http';
import {sleep} from 'k6';

export const options = {
    // Key configurations for breakpoint in this section
    executor: 'ramping-arrival-rate', //Assure load increase if the system slows
    stages: [
        { duration: '2h', target: 100 }, // just slowly ramp-up to a HUGE load
    ],
    thresholds: {
        http_req_failed: ['rate<0.01'], // http errors should be less than 1%
    },
};

export default () => {
    const urlRes = http.get('https://projetc.abdelatif-aitbara.link');
    sleep(1);
};
