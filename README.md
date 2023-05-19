# Setting Up Your New MacBook

## Introduction

A special acknowledgment to [driesvints](https://github.com/driesvints/dotfiles).

This repository was created with the goal of simplifying the setup and management process for my Mac. By utilizing this repository, I can avoid the tedious task of manually installing everything. The accompanying readme provides a comprehensive guide for setting up my preferred macOS configuration. Feel free to explore, learn from, or even adapt parts of it for your own dotfiles. I hope you find it both helpful and enjoyable!

This repository is specifically tailored for setting up new Mac devices. However, if you're looking to start building your own dotfiles from scratch, you can find inspiration [here](https://github.com/driesvints/dotfiles).

### Backing Up Your Data

Before migrating to a new Mac, it's crucial to back up all your existing data. Make sure you've covered everything on the checklist below before proceeding with the migration:

- Have you committed and pushed any changes/branches to your Git repositories?
- Have you saved all important documents from non-iCloud directories?
- Have you backed up work from apps that aren't synced through iCloud?
- Have you exported important data from your local database?
- Have you updated [mackup](https://github.com/lra/mackup) to the latest version and performed a `mackup backup`?

### Setting Up Your Mac

After securely backing up your old Mac, you can now follow the installation instructions below to set up your new one:

1. Update macOS to the latest version through System Preferences.
2. Generate a new public and private SSH key by running the following command:

   ```zsh
   curl https://raw.githubusercontent.com/Remi-deronzier/public-dotfiles/main/ssh.sh | sh -s "<your-email-address>"
   ```

3. Clone this repository to `~/.dotfiles` using the following command:

   ```zsh
   git clone git@github.com:Remi-deronzier/dotfiles.git ~/.dotfiles
   ```

4. Run the installation process with the following command:

   ```zsh
   cd ~/.dotfiles && ./install.sh
   ```

5. Once mackup is synced with your cloud storage, restore preferences by executing `mackup restore`.
6. Restart your computer to finalize the setup process.

Congratulations! Your Mac is now ready to be used!

> 💡 If desired, you can choose a different location for the repository, but remember to update the reference in the [`.zshrc`](./.zshrc#L2) file accordingly.
