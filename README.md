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
```

### Example Output

```bash
$ docker run --rm -v $(pwd):/app md2atlassian toto.md
h1. Jobs

h2. Last jobs Host

h3. List last jobs runned on specific host

{code:language=python|borderStyle=solid|theme=RDark|linenumbers=true|collapse=false}
hostid = Host.objects.get(id=760611)
>>> print(hostid.name, hostid.inventory, hostid.last_job)
dfrassiawxa001.int.adeo.com regression-test-2233 2025-02-18 15:31:41.579829+00:00-4738777-failed
{code}

h3. List all hosts where avn&#39;t last_job

{code:language=python|borderStyle=solid|theme=RDark|linenumbers=true|collapse=false}
empty_jobs = Host.objects.filter(last_job=None)
compteur = 0
for host in empty_jobs:
    print(host.name, host.inventory)
    compteur += 1
.
.
{code}

{code:language=python|borderStyle=solid|theme=RDark|linenumbers=true|collapse=false}
>>>print(compteur)
108742
{code}
```
