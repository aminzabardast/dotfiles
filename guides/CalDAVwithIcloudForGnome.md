# CalDAV and iCloud

## What is CalDAV?

CalDAV is a protocol that allows clients to access calendar data on a remote server. It is an extension of the WebDAV protocol, which is used for web-based file management. CalDAV enables users to manage their calendars, schedule events, and share calendar information across different devices and platforms.

## Accessing and Syncing iCloud Calendars

If you are a person who is engrained in the Apple ecosystem, you might want to access your iCloud calendars on a Linux machine (like me). The easiest way to do this is to use the CalDAV protocol. Accessing your iCloud calendars via CalDAV is not as straightforward as accessing your Google calendars (on Gnome, for example). However, it is possible. Here are the steps to access your iCloud calendars using CalDAV:

1. Go to [`appleid.apple.com`](https://appleid.apple.com/), log in to your Apple ID, and generate an app-specific password. This password will be used to authenticate your iCloud account when accessing it via CalDAV.
2. Install Evolution on your Linux machine. Evolution is a personal information management application that includes support for CalDAV. Adding CalDAV calendars using Evolution is easier and you can still use your preferred calendar application (like Gnome Calendar) to access the calendars.
3. Open Evolution and go to `Edit` > `Accounts`, then `Add` > `Calendar` > Type: `CalDAV`.
4. Enter the following information:
   - **Server**: `https://caldav.icloud.com`
   - **Username**: Your Apple ID email address
   - **Password**: The app-specific password you generated in step 1
5. Choose from the list of calendars you want to sync.
