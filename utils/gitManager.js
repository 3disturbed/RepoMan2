import simpleGit from 'simple-git';

export const checkForUpdates = async (repoUrl) => {
    const git = simpleGit();
    await git.fetch(repoUrl);
    const status = await git.status();
    return status.behind > 0; // Check if local repo is behind
};

export const pullRepo = async () => {
    const git = simpleGit();
    await git.pull();
};

