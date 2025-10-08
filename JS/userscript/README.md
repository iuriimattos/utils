# Debugging `.userscript.js` Locally

This guide provides step-by-step instructions on how to debug a `.userscript.js` file locally using [ViolentMonkey](https://old.reddit.com/r/ViolentMonkey/). For more details, refer to the [official blog post](https://violentmonkey.github.io/posts/how-to-edit-scripts-with-your-favorite-editor/).

## Prerequisites

- Install [Node.js](https://nodejs.org/) (required for `http-server`).
- Install a userscript manager like [ViolentMonkey](https://violentmonkey.github.io/).

---

## Steps to Debug `.userscript.js` Locally

1. **Save the Script File**  
   Save your userscript file with the extension `.user.js`. For example:
   ```
   my-script.user.js
   ```

2. **Install `http-server`**  
   Install the `http-server` package globally using npm:
   ```bash
   npm install --global http-server
   ```

3. **Start the HTTP Server**  
   Navigate to the directory containing your `.user.js` file and start the HTTP server:
   ```bash
   http-server -c-1
   ```
   - The `-c-1` option disables caching, ensuring that changes to your script are always reflected immediately.

4. **Load the Script in ViolentMonkey**  
   - Open ViolentMonkey in your browser.
   - Add a new script and use the following URL to load your script:
     ```
     http://localhost:8080/my-script.user.js
     ```
   - Replace `my-script.user.js` with the name of your script file.

5. **Edit and Debug**  
   - Use your favorite code editor (e.g., VS Code) to edit the `.user.js` file.
   - Reload the script in ViolentMonkey to see the changes.

---

## Additional Notes

- For Tampermonkey users, consider the [Tampermonkey Editors Chrome Extension](https://chromewebstore.google.com/detail/tampermonkey-editors/lieodnapokbjkkdkhdljlllmgkmdokcm) for better integration with [vscode.dev](https://vscode.dev).  
- Follow the progress of the [feature request](https://github.com/violentmonkey/violentmonkey/issues/1994) to add integration with `vscode.dev`.

---

By following these steps, you can debug and develop `.userscript.js` files locally with ease.
