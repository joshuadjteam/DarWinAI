# DarwinAI Chat with Batch File

This repository contains a simple batch script that allows you to chat with Google's AI model (branded here as **"DarwinAI"**) directly from your Windows command prompt, using a graphical input box. It utilizes the fast and efficient `Gemma` model.

## Features

* Interactive chat with DarwinAI (powered by Google's `Gemma` model).
* Graphical input box for questions (no typing directly into the console).
* Continuous conversation: ask multiple questions without restarting the script.
* Easy to set up and run on Windows.

## Requirements

* **Windows 10/11 PC:** `curl.exe` is pre-installed.
* **Google Gemini API Key:** Each user needs their own API key linked to a project where the Generative Language API is enabled.
* **jq.exe:** A command-line JSON processor.

## Setup & Installation

1.  **Clone or Download this Repository:**
    * **Using Git:**
        ```bash
        git clone [https://github.com/joshuadjteam/DarWinAI.git](https://github.com/joshuadjteam/DarWinAI.git)
        cd DarWinAI
        ```
    * **Direct Download:** Go to [https://github.com/joshuadjteam/DarWinAI](https://github.com/joshuadjteam/DarWinAI), click the green "Code" button -> "Download ZIP", then extract the contents to a folder.

2.  **Run the Setup Script:**
    * Navigate to the folder where you extracted the repository files.
    * **Right-click on `setup.cmd` and select "Run as administrator."** This is crucial for creating the `C:\DarwinAI` directory and installing applications.
    * Follow the on-screen prompts. This script will:
        * Install/upgrade `curl` and `jq` via `winget`.
        * Create the `C:\DarwinAI\` directory.
        * Download `DarwinAI.zip` (containing the core AI files) from `https://github.com/joshuadjteam/DarWinAI/releases/download/InstallBlobs/DarwinAI.zip`
        * Unzip `DarwinAI.zip` into `C:\DarwinAI\`.

3.  **Obtain and Configure Your Google Gemini API Key (Manual Step):**
    * Go to [Google AI Studio](https://aistudio.google.com/app/apikey).
    * Log in with your Google account.
    * Click "Create API Key" (or use an existing one).
    * **Copy your new API key carefully.**
    * **Important:** Ensure the "Generative Language API" is enabled for the Google Cloud project associated with your API key. You can check this at [https://console.cloud.google.com/apis/library/generativelanguage.googleapis.com](https://console.cloud.google.com/apis/library/generativelanguage.googleapis.com).
    * Now, open the `talk_to_ai_with_input.bat` file located in `C:\DarwinAI\` using Notepad.
    * Find the line that sets the API key (it will look similar to `set "API_KEY=YOUR_GEMINI_API_KEY_HERE"` or `set "API_KEY=AIzaSyCMbImhuRkNmnCylt35tq0HQ079dbBKtAg"`).
    * **Replace the fake key with your OWN or a testing key**
    * Save the `DarWinAI.bat` file.

4.  **Verify `curl.exe` (Usually Pre-installed):**
    * Open Command Prompt (`cmd`) and type `curl --version`.
    * If you see version information, `curl` is working.
    * If you get an error like "'curl' is not recognized...", you can install it via Winget:
        ```bash
        winget install curl
        ```
        (You may need to run Command Prompt as administrator for this.)

## How to Use

1.  Once all the setup steps are complete, navigate to `C:\DarwinAI\` in File Explorer.
2.  **Double-click `DarWinAI.bat`**.
3.  A graphical input box will appear. Type your question for **DarwinAI** and click "OK".
4.  **DarwinAI's** response will be displayed in the command prompt.
5.  Press any key to ask another question.
6.  To end the conversation, click "Cancel" in the input box, or simply close the command prompt window.

## Troubleshooting

### `curl: (35) schannel: next InitializeSecurityContext failed...` Error

This error often occurs during the download of `DarwinAI.zip` within `setup.cmd` and indicates a problem with certificate revocation checks on your system, frequently caused by antivirus software or firewall settings.

**Potential Solutions:**

1.  **Temporarily Disable Antivirus/Security Software:**
    * If you have antivirus software with "Web Shield," "HTTPS scanning," or "SSL inspection" features, temporarily disable them. Then, try running `setup.cmd` again. If this resolves the issue, you may need to add exceptions for `curl.exe` and `powershell.exe` in your antivirus.

2.  **Modify `setup.cmd` with `--ssl-no-revoke` (Workaround):**
    * This flag tells `curl` to skip the certificate revocation check, which can resolve the error. **Note:** This reduces security slightly as certificate revocation is not checked. Use this if other methods fail, and you understand the implications.
    * Open `setup.cmd` in Notepad.
    * Find the line that performs the download:
        ```batch
        curl -L -o "%TEMP%\%ZIP_FILENAME%" "%DOWNLOAD_URL%"
        ```
    * **Change it to:**
        ```batch
        curl -L --ssl-no-revoke -o "%TEMP%\%ZIP_FILENAME%" "%DOWNLOAD_URL%"
        ```
    * Save `setup.cmd` and run it again.

3.  **Check Internet Options / Proxy Settings:**
    * Open "Internet Options" from the Control Panel. In the "Advanced" tab, ensure "Check for server certificate revocation" is enabled under "Security." Also, check "LAN settings" in the "Connections" tab if you use a proxy.

3.  **Configure Your API Key in the Batch File:**
    * Open `DarWinAU.bat` in Notepad.
    * Find the line: `set "API_KEY=AIzaSyCMbImhuRkNmnCylt35tq0HQ079dbBKtAg"`
        (or whatever the current key is in your batch file).
    * **Replace the existing key with *your own new API key* that you copied from Google AI Studio.**
    * Save the `DarWinAI.bat` file.

4.  **Download `jq.exe`:**
    * `jq` is used to parse the AI's response.
    * Go to the official `jq` download page for Windows: [https://jqlang.github.io/jq/download/](https://jqlang.github.io/jq/download/)
    * Download `jq-win64.exe` (for 64-bit Windows) or `jq-win32.exe` (for 32-bit Windows).
    * **Rename the downloaded file to `jq.exe`** and place it in the same folder as `talk_to_ai_with_input.bat` and `get_input.vbs`.

5.  **Verify `curl.exe` (Usually Pre-installed):**
    * Open Command Prompt (`cmd`) and type `curl --version`.
    * If you see version information, `curl` is working.
    * If you get an error like "'curl' is not recognized...", you can install it via Winget:
        ```bash
        winget install curl
        ```
        (You may need to run Command Prompt as administrator for this.)



## How to Use

1.  Once all the setup steps are complete, simply **double-click `DarWinAI.bat`**.
2.  A graphical input box will appear. Type your question for **DarwinAI** and click "OK".
3.  **DarwinAI's** response will be displayed in the command prompt.
4.  Press any key to ask another question.
5.  To end the conversation, click "Cancel" in the input box, or simply close the command prompt window.

# Temporary Testing Keys

## These are all the test keys you may use (Do NOT ABUSE)

1. AIzaSyAElo416iDHo8nHmFFsIOTHvNgcN29Cbk4

2. AIzaSyA4a1wOodLcLPHEXVBNUPyKM4pKm-0TYCI

3. AIzaSyCVgI8m4-07DHVx4LMab-oFzZm2_NN9e58

4. AIzaSyDBuZe4wWUH3b_AnZ--iPb3aLCxauuRymo

5. AIzaSyCJIED3Av7WnM1PBvnRl06MIj9938v2pfk

6. AIzaSyD3PGB-HHWN02_3XsTNag5CyKdYm7fSTug

7. AIzaSyDdpDACWiy3A4lZMc4j-PiIicJv5lgZqnQ

8. AIzaSyCIxwBk0MrsvZmVbqOjUzkueSq0VMj-wQg

9. AIzaSyCIEk4dUHLdV8BnVYyOuTicX-YA-ucCDuQ

10. AIzaSyDNcf1R2snat2fSm14hvGngEJ1xqluYHCc

11. AIzaSyBHRUdITOYf_LpvyYH1ppDuIpWIv7cAeEI

12. AIzaSyAIZHFOatj0Ajfo4Psmm0Q9p2Qmnh1sjQ4

13. AIzaSyAsbKFVYb_woEsg_OFlTdWhKK8SN91YyfY

14. AIzaSyBuc_WIabKbsycGK0evQm93M_7c7cIZSsI

15. AIzaSyC4yQmK8-PeZbmf3ZkF7-2vhaooYhbZwFc
