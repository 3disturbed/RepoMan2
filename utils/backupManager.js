import fs from 'fs-extra';

const BACKUP_DIR = './RepoMan_Backup';

export const createBackup = async () => {
    if (!fs.existsSync(BACKUP_DIR)) {
        fs.mkdirSync(BACKUP_DIR);
    }
    await fs.copy('./', BACKUP_DIR, { overwrite: true });
};

export const restoreBackup = async () => {
    await fs.copy(BACKUP_DIR, './', { overwrite: true });
};

export const clearBackup = async () => {
    await fs.emptyDir(BACKUP_DIR);
};

