# Tools Information
**ketch**: A blazing fast CLI for agentic search and scrape workflows. 
Basic commands include:
- `ketch search <query>`: Search the web and return results.
- `ketch scrape <url>`: Scrape URLs and extract clean markdown.
- `ketch extract`: Convert piped HTML to clean markdown.
- `ketch code <query>`: Search code across open-source repositories.
- `ketch crawl <url>`: Crawl a site and extract pages.
- `ketch docs <query>`: Search library documentation.

**copyq**: Clipboard manager. 
  - `copyq clipboard` — show current clipboard content
  - `copyq add -- "text"` — add text to clipboard history
  - `copyq read 0` — print most recent item (0 = newest, 1 = second, etc.)
  - `copyq read 0 1 2` — print first three items
  - `copyq < file.txt copy` — copy a file's contents into the clipboard
  - `copyq < image.jpg copy image/jpeg` — copy an image into the clipboard
Installed via: sudo pacman -S copyq
