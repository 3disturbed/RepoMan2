import { checkForUpdates, pullRepo } from './utils/gitManager.js';
import { createBackup, restoreBackup, clearBackup } from './utils/backupManager.js';
import { restartService } from './utils/serviceManager.js';
import { sendEmail } from './utils/notifier.js';
import dotenv from 'dotenv';

dotenv.config();

class RepoMan {
    constructor() {
        this.repoUrl = process.env.REPO;
        this.checkInterval = parseInt(process.env.CHECK_INTERVAL) || 1800000; // Default 30 min
        this.adminEmail = process.env.ADMIN_EMAIL;
        this.init();
    }

    async init() {
        try {
            console.log('RepoMan: Checking for updates...');
            const hasUpdates = await checkForUpdates(this.repoUrl);
            if (hasUpdates) {
                await this.handleUpdate();
            } else {
                console.log('RepoMan: No updates found.');
            }
            this.scheduleUpdateCheck();
        } catch (error) {
            console.error('RepoMan: Initialization failed', error);
            await sendEmail(this.adminEmail, 'RepoMan Initialization Failed', error.message);
        }
    }

    async handleUpdate() {
        try {
            console.log('RepoMan: Backing up current files...');
            await createBackup();

            console.log('RepoMan: Pulling updates...');
            await pullRepo();

            console.log('RepoMan: Restarting service...');
            const success = await restartService();

            if (success) {
                console.log('RepoMan: Service restarted successfully.');
                await sendEmail(this.adminEmail, 'Stability Notice', 'Service running successfully after update.');
                setTimeout(() => clearBackup(), this.checkInterval);
            } else {
                throw new Error('Service failed to start after update.');
            }
        } catch (error) {
            console.error('RepoMan: Update failed, restoring backup...');
            await restoreBackup();
            await sendEmail(this.adminEmail, 'RepoMan Update Failed', error.message);
        }
    }

    scheduleUpdateCheck() {
        setInterval(async () => {
            console.log('RepoMan: Checking for updates...');
            const hasUpdates = await checkForUpdates(this.repoUrl);
            if (hasUpdates) {
                await this.handleUpdate();
            }
        }, this.checkInterval);
    }
}

export default RepoMan;

