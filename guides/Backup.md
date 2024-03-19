# Backup Solution

You can use [Timeshift](https://wiki.archlinux.org/title/Timeshift) as backup solution. Timeshift requires [cron](https://wiki.archlinux.org/title/cron) to scheduling.

Steps:
1. Install cron.
    ```shell
    paru -S cronie
    ```
2. Initiate the cron service.
    ```shell
    systemctl enable --now cronie.service
    ```
3. Install Timeshift.
    ```shell
    paru -S timeshift
    ```
4. Run the `timeshift` for the first time.
    ```shell
    sudo timeshift --check
    ```
5. Edit the `timeshift` config file (`/etc/timeshift/timeshift.json`) and modify it based on your perferences.
    - I enable hourly and monthly backups.
    - I only keep one monthly and two daily backups.
    - I add some more location to be ignored by `timeshift`

You can check the state of your backups by running `sudo timeshift --list`
