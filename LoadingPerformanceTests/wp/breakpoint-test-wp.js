import http from 'k6/http';
import {sleep} from 'k6';

export const options = {
    // Key configurations for breakpoint in this section
    executor: 'ramping-arrival-rate', //Assure load increase if the system slows
    stages: [
        { duration: '20m', target: 100 }, // just slowly ramp-up to a HUGE load
    ],
};

export default () => {
    const urlRes = http.get('https://projetc.abdelatif-aitbara.link');
    sleep(1);
};
