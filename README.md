# DarwinAI Chat with Batch File

This repository contains a simple batch script that allows you to chat with AI directly from your Windows command prompt, using a graphical input box. It utilizes the "Gemini 2.5 Flash"

## Features

* Interactive chat with DarwinAI (powered by Google's `gemini-2.5-flash-preview-05-20` model).
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
        git clone [https://github.com/your-github-username/darwinai-chat-batch.git](https://github.com/your-github-username/darwinai-chat-batch.git)
        cd darwain-chat-batch
        ```
        (Consider renaming your GitHub repo to `darwinai-chat-batch` for consistency)
    * **Direct Download:** Go to [https://github.com/your-github-username/your-repo-name](https://github.com/your-github-username/your-repo-name), click "Code" -> "Download ZIP", then extract the contents to a folder.

2.  **Obtain Your Google Gemini API Key:**
    * Go to [Google AI Studio](https://aistudio.google.com/app/apikey).
    * Log in with your Google account.
    * Click "Create API Key" (or use an existing one).
    * **Copy your new API key carefully.**
    * **Important:** Ensure the "Generative Language API" is enabled for the Google Cloud project associated with your API key. You can check this at [https://console.cloud.google.com/apis/library/generativelanguage.googleapis.com](https://console.cloud.google.com/apis/library/generativelanguage.googleapis.com).

3.  **Configure Your API Key in the Batch File:**
    * Open `talk_to_ai_with_input.bat` in Notepad.
    * Find the line: `set "API_KEY=AIzaSyCMbImhuRkNmnCylt35tq0HQ079dbBKtAg"`
        (or whatever the current key is in your batch file).
    * **Replace the existing key with *your own new API key* that you copied from Google AI Studio.**
    * Save the `talk_to_ai_with_input.bat` file.

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

1.  Once all the setup steps are complete, simply **double-click `talk_to_ai_with_input.bat`**.
2.  A graphical input box will appear. Type your question for **DarwinAI** and click "OK".
3.  **DarwinAI's** response will be displayed in the command prompt.
4.  Press any key to ask another question.
5.  To end the conversation, click "Cancel" in the input box, or simply close the command prompt window.

---

**Remember to:**

* Save this text as `README.md` (exactly that filename, no extension) in the root of your GitHub repository.
* Consider renaming your GitHub repository to something like `darwinai-chat-batch` to match the branding, although it's not strictly necessary for functionality.
