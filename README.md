# Tab Index

Shows tab index numbers so you always know which tab `Ctrl/Cmd+1-8` will jump to.

## Floorp (userChrome.css)

Adds numbered badges directly onto each tab in the tab bar.

### Install

```bash
./install.sh
```

This copies `userChrome.css` into your Floorp profile's `chrome/` directory. Restart Floorp to see changes.

To pull changes back from your profile:

```bash
./install.sh pull
```

## Chrome Extension

Prepends circled index numbers to each tab's title (e.g. `❶ GitHub`, `❷ Google`) and shows a badge on the extension icon.

### Install

1. Open `chrome://extensions`
2. Enable **Developer mode** (toggle in the top right)
3. Click **Load unpacked**
4. Select the `chrome/` folder from this repo

### Features

- Tabs 1-8 show filled circles (❶-❽) — these have `Ctrl/Cmd+1-8` shortcuts
- Tabs 9+ show outlined circles (⑨-⑳)
- The last tab shows a filled circle (has `Ctrl/Cmd+9` shortcut)
- Badge number on the extension icon per tab
- Click the extension icon to see all tabs with their index and shortcut

### Build .zip

```bash
cd chrome
./build.sh
```

## Firefox Extension

See [firefox-tab-index](https://github.com/34RTHY/firefox-tab-index) for the Firefox version.
