```markdown
# 🧩 Fixing `ModuleNotFoundError` in Sublime Text Plugins

When developing or installing a custom Sublime Text plugin that depends on external Python modules (like `lark`), you might encounter this error:

```
ModuleNotFoundError: No module named 'lark'
```

This happens because Sublime Text uses its own embedded Python environment and doesn't have access to your system's Python packages.

---

## ✅ Solution: Manually Install the Module into Sublime's Python Environment

### Step-by-Step Guide

#### 1. **Install Your Plugin**
Place your custom plugin folder (e.g., `HighlightWords`) into:

```
%AppData%\Sublime Text\Packages
```

#### 2. **Download the Required Module**
Go to the Lark PyPI page and download the `.tar.gz` source archive.

#### 3. **Extract the Module**
- Open the `.tar.gz` file using a tool like 7-Zip or WinRAR.
- Navigate to:
  ```
  lark-1.2.2.tar\lark-1.2.2\lark-1.2.2\lark
  ```
- This `lark` folder contains the actual Python module.

#### 4. **Copy the Module into Sublime's Python Path**
Paste the `lark` folder into:

```
%AppData%\Sublime Text\Lib\python38
```

> This makes the `lark` module available to all Sublime Text plugins using Python 3.8.

---

## ✅ Result

Your plugin should now load without errors and be able to use:

```python
import lark
```

---

## 📝 Notes

- This method works for any pure Python module (i.e., no compiled C extensions).
- If you need to include multiple dependencies, repeat the process for each one.
- For better plugin portability, consider vendoring dependencies inside your plugin folder and adjusting import paths accordingly.

---

```

Let me know if you'd like this saved as a `.md` file or turned into a GitHub Gist!