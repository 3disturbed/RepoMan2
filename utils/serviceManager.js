import { exec } from 'child_process';

export const restartService = () => {
    return new Promise((resolve, reject) => {
        exec('npm run start', (error, stdout, stderr) => {
            if (error) {
                console.error(`Service restart failed: ${stderr}`);
                reject(error);
            } else {
                console.log(`Service restarted: ${stdout}`);
                resolve(true);
            }
        });
    });
};

