# Easy-YoutubeDL
Easy Youtube-DL GUI built with Autohotkey. Just download and run the `.exe`

## Install
1. Make sure you have FFMPEG installed on your system
   1. [Download precompiled ffmpeg](https://www.gyan.dev/ffmpeg/builds/)
   2. Add ffmpeg `bin` folder to you path
   3. ─ OR ─ Try running `choco install ffmpeg` in an administrator command prompt

2. Make sure you have YoutubeDL in your path.
   1. [Download youtube-dl from Github](https://github.com/ytdl-org/youtube-dl/releases) (Get the latest `.exe` version)
   2. Save it to `C:\Program Files\youtube-dl` (*Or any folder really, this is just where id put it*)
   3. Add that same folder to your `path`

3. Download the `.zip` folder of the [latest release](https://github.com/Awbmilne/Simple-YoutubeDL-GUI/releases) for this app.
   1. Download the `.zip`
   2. Unzip it
   3. Use it on its own, or add it to your Start Menu, Or even your startup folder so that it runs at login.

## Usage
1. Run the `Simple_Youtube-dl_GUI.exe` app.

1. The tool is now running (You may get a notifcation saying so). Now that it is running, you can use the keyboard shortcuts:
    - `Win + Alt + Y` Opens the YoutubeDL Download GUI. Easy to use. You can paste multiple URLs so that it automatically starts the next download after the previous.
        ```text
        https://youtube.com/video_1_url
        - or -
        https://youtube.com/video_1_url, https://youtube.com/video_2_url, https://youtube.com/video_3_url
        ```
    - `Win + Alt + Esc` To stop the script. You can also Right Click the Autohotkey track icon to stop the script.\

## Customization
By Default, the App downloads to the `Downloaded_Videos` folder in the same location as the `.exe`.

If you want to change the download path for the app, Open the `Download_Path.cfg` file and replace `.\Downloaded_Videos` with the path to whatever folder you want. The most common use case is to use your downloads Folder.\
\
***Download_Path.txt***
```text
C:\Users\<username>\Downloads
```