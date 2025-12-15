# This Dockerfile is for a Python application that uses the markdown-to-confluence package and mermaid-cli.
FROM python:3.11-slim

# Installe les dépendances système nécessaires
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    npm \
    vim \
 && rm -rf /var/lib/apt/lists/*

# Install markdown-to-confluence
# https://github.com/garyyeap/markdown2confluence
# https://confluence.atlassian.com/display/CONF42/Confluence+Wiki+Markup
RUN npm install -g markdown2confluence

# Set the working directory
WORKDIR /app

ENTRYPOINT ["markdown2confluence"]
