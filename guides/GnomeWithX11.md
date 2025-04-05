# Default Gnome to X11

This is a guide to set Gnome to use X11 instead of Wayland. This is useful for applications that do not work well with Wayland, such as some screen sharing applications and gaming software.

## Prerequisites

- You need to have Gnome installed on your system.
- You need to have access to the terminal.
- You need to have administrative privileges to modify system files.

## Steps

1. **Edit the GDM configuration file**: You need to edit the GDM (GNOME Display Manager) configuration file to set the default session to X11. Run the following command in the terminal:
   ```bash
   sudo vim /etc/gdm/custom.conf
   ```
3. **Uncomment the Wayland line**: In the `custom.conf` file, look for the line that says:
   Uncomment this line by removing the `#` at the beginning, so it looks like this:
   ```bash
   WaylandEnable=false
   ```
4. **Log out and log back in**: Log out of your current session and log back in. You should now be using X11 instead of Wayland.
5. **Verify the session**: To verify that you are using X11, open a terminal and run the following command:

   ```bash
   echo $XDG_SESSION_TYPE
   ```
   If the output is `x11`, then you are successfully using X11.
