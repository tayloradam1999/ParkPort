<div align="center">

![TitleColor](https://github.com/tayloradam1999/ParkPort/blob/main/assets/images/titlecolor.png)

</div>

## Description

ParkPort is a smartphone application that utilizes geolocation to guide the user to explore Tulsa's parks and collect augmented reality stamps.

Before settling on ParkPort, our group got together and decided what the objective goal of our application would be and settled on bridging communities in Tulsa! [Rachel Lewis](https://github.com/RLewis11769) and [Garrison Shoemake](https://github.com/Garrison-Shoemake) love to explore, [Stratton Brooks](https://github.com/szbrooks2017) is a national park aficionado, and [Adam Taylor](https://github.com/tayloradam1999), our group’s disc golfer, was looking for a way to explore Tulsa when he came to Holberton from out of state. Parkport was born as this bridge to get Tulsans out into one more park, one more time we’re super excited to share our ParkPort journey with you.

##  Table of Contents

-  [Tools Used](#tools-used)

-  [Installation](#installation)

-  [Features](#features)

-  [Credits](#credits)


##  Tools Used

<img width="25%" height="25%" src="https://dart.dev/assets/shared/dart-logo-for-shares.png?2">
  
<img src="https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png" width="25%" height="50%">
  
<img src="https://firebase.google.com/downloads/brand-guidelines/PNG/logo-standard.png" width="25%" height="50%">

<img src="https://freepngimg.com/download/google/66964-google-platform-maps-suite-logo-cloud.png" width="25%">

<img src="https://storage.googleapis.com/gweb-uniblog-publish-prod/images/logo_ARCore_lockup_Horizontal.max-1000x1000.png" width="25%" height="50%">

<img src="https://logos-world.net/wp-content/uploads/2021/02/Google-Cloud-Logo.png" width="25%" height="50%">


## Installation

### System Requirements
- **Operating Systems:** Windows 10 or later (64-bit), x86-64 based.
-   **Disk Space**: 1.64 GB (does not include disk space for IDE/tools).
- **Tools**: Flutter depends on these tools being available in your environment.
   -   [Windows PowerShell 5.0](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-windows-powershell)  or newer (this is pre-installed with Windows 10)
   - [Git for Windows](https://git-scm.com/download/win) 2.x, with the **Use Git from the Windows Command Prompt** option.
 -  If Git for Windows is already installed, make sure you can run  `git`  commands from the command prompt or PowerShell.

### Get the Flutter SDK
- Download the following installation bundle to get the latest stable release of the [Flutter SDK](https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.0.2-stable.zip)
  - For other release channels, and older builds, see the [SDK releases](https://docs.flutter.dev/development/tools/sdk/releases) page.
-  Extract the zip file and place the contained  `flutter`  in the desired installation location for the Flutter SDK (for example,  `C:\src\flutter`).

If you don’t want to install a fixed version of the installation bundle, you can skip steps 1 and 2. Instead, get the source code from the [Flutter repo](https://github.com/flutter/flutter) on GitHub, and change branches or tags as needed. For example:

```
C:\src>git clone https://github.com/flutter/flutter.git -b stable
```
You are now ready to run Flutter commands in the Flutter Console.

### Update your path
If you wish to run Flutter commands in the regular Windows console, take these steps to add Flutter to the `PATH` environment variable:

-   From the Start search bar, enter ‘env’ and select  **Edit environment variables for your account**.
-   Under  **User variables**  check if there is an entry called  **Path**:
    -   If the entry exists, append the full path to  `flutter\bin`  using  `;`  as a separator from existing values.
    -   If the entry doesn’t exist, create a new user variable named  `Path`  with the full path to  `flutter\bin`  as its value.

You have to close and reopen any existing console windows for these changes to take effect.

### Run flutter doctor
From a console window that has the Flutter directory in the path (see above), run the following command to see if there are any platform dependencies you need to complete the setup:

```
C:\src\flutter>flutter doctor
```

This command checks your environment and displays a report of the status of your Flutter installation. Check the output carefully for other software you might need to install or further tasks to perform (shown in **bold** text).

For example:
[-] Android toolchain - develop for Android devices
    • Android SDK at D:\Android\sdk
    **✗ Android SDK is missing command line tools; download from https://goo.gl/XxQghQ**
    • Try re-installing or updating your Android SDK,
      visit https://docs.flutter.dev/setup/#android-setup for detailed instructions.

The following sections describe how to perform these tasks and finish the setup process. Once you have installed any missing dependencies, you can run the `flutter doctor` command again to verify that you’ve set everything up correctly.

### Set up your Android device
To prepare to run and test your Flutter app on an Android device, you need an Android device running Android 4.1 (API level 16) or higher.
1.  Enable  **Developer options**  and  **USB debugging**  on your device. Detailed instructions are available in the  [Android documentation](https://developer.android.com/studio/debug/dev-options).
2.  Windows-only: Install the  [Google USB Driver](https://developer.android.com/studio/run/win-usb).
3.  Using a USB cable, plug your phone into your computer. If prompted on your device, authorize your computer to access your device.
4.  In the terminal, run the  `flutter devices`  command to verify that Flutter recognizes your connected Android device. By default, Flutter uses the version of the Android SDK where your  `adb`  tool is based. If you want Flutter to use a different installation of the Android SDK, you must set the  `ANDROID_SDK_ROOT`  environment variable to that installation directory.

### Agree to Android Licenses

Before you can use Flutter, you must agree to the licenses of the Android SDK platform. This step should be done after you have installed the tools listed above.

1.  Make sure that you have a version of Java 8 installed and that your  `JAVA_HOME`  environment variable is set to the JDK’s folder.
    
    Android Studio versions 2.2 and higher come with a JDK, so this should already be done.
    
2.  Open an elevated console window and run the following command to begin signing licenses.
    
    _content_copy_
    
    ```
    $ flutter doctor --android-licenses
    
    ```
    
3.  Review the terms of each license carefully before agreeing to them.
4.  Once you are done agreeing with licenses, run  `flutter doctor`  again to confirm that you are ready to use Flutter.


### Windows setup

For Windows desktop development, you need the following in addition to the Flutter SDK:

-   [Visual Studio 2022](https://visualstudio.microsoft.com/downloads/)  When installing Visual Studio you need the “Desktop development with C++” workload installed for building windows, including all of its default components.

### Clone repository
Run the following command inside of your terminal:

```
git clone https://github.com/tayloradam1999/ParkPort.git
```

### Change directories
Run the following command to change to your new ParkPort directory:

```
cd .\ParkPort\
```

### Install dependencies
Run the following code to install ParkPort's dependencies:
```
flutter pub get
```

### Build to your Android device
With your plugged in Android device being the selected platform to build the application on in VSCode, run the following command to have your very own ParkPort application!
```
flutter run
```

## Features

### User Authentication through Firebase
![Login](https://github.com/tayloradam1999/ParkPort/blob/main/assets/screenshots/Login.png)

### Geolocation
![Geolocation](https://github.com/tayloradam1999/ParkPort/blob/main/assets/screenshots/Profile.png)

### Profile Page
![Profile](https://github.com/tayloradam1999/ParkPort/blob/main/assets/screenshots/Profile.png)

### Passport Page
![Passport](https://github.com/tayloradam1999/ParkPort/blob/main/assets/screenshots/Passport.png)

### Notifications
![Notifications](https://github.com/tayloradam1999/ParkPort/blob/main/assets/screenshots/Notifications.png)

### Friends List
![Friends](https://github.com/tayloradam1999/ParkPort/blob/main/assets/screenshots/FriendsList.png)

### Leaderboards
![Leaderboards](https://github.com/tayloradam1999/ParkPort/blob/main/assets/screenshots/Notifications.png)

### Park Details Carousel
![Park Details](https://github.com/tayloradam1999/ParkPort/blob/main/assets/screenshots/ParkDetails.png)

### Settings Page
![Settings](https://github.com/tayloradam1999/ParkPort/blob/main/assets/screenshots/Settings.png)

## Credits
**Front-End Engineer**: Adam Taylor ([LinkedIn:](https://www.linkedin.com/in/tayloradam1999/))
**Back-End Engineer**: Rachel Lewis ([LinkedIn:](https://www.linkedin.com/in/rachelarlewis/))'
**Project Manager + Mapping Engineer**: Garrison Shoemake ([LinkedIn:](https://www.linkedin.com/in/garrison-shoemake/))
**XR Engineer**: Stratton Brooks ([LinkedIn:](https://www.linkedin.com/in/stratton-brooks/))