# md2atlassian Docker Image

This Docker image provides a lightweight environment to convert Markdown files into Confluence Wiki Markup using the [`markdown-to-confluence`](https://github.com/garyyeap/markdown2confluence) Node.js CLI tool.

## 🐳 Image Overview

- **Base Image:** `python:3.11-slim`
- **Tools Installed:**
  - `markdown2confluence` (via npm)
  - System utilities (`curl`, `gnupg`, `npm`)
- **Entry Point:** `markdown2confluence`

## 📦 Usage

### Build the Docker Image

```bash
docker build -t md2atlassian .
```

### Run with Docker

```bash
docker run --rm -v $(pwd):/app md2atlassian yourfile.md
