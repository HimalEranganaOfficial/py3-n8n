# 🐍 py3-n8n

[![Docker Hub](https://img.shields.io/docker/v/himalerangana/py3-n8n?label=Docker%20Hub&logo=docker)](https://hub.docker.com/r/himalerangana/py3-n8n)
[![Docker Pulls](https://img.shields.io/docker/pulls/himalerangana/py3-n8n?logo=docker)](https://hub.docker.com/r/himalerangana/py3-n8n)
[![n8n](https://img.shields.io/badge/n8n-Workflow%20Automation-orange)](https://n8n.io/)
[![Python](https://img.shields.io/badge/Python-3.12-green?logo=python)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> **n8n workflow automation with full Python 3 support**

A custom Docker image that extends the official [n8n](https://n8n.io/) image with Python 3, pip, and pipx pre-installed. Perfect for running Python scripts within your n8n workflows!

---

## 📥 Pull from Docker Hub

```bash
docker pull himalerangana/py3-n8n
```

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🐍 **Python 3.12** | Full Python installation |
| 📦 **pip** | Python package installer (PEP 668 restrictions removed) |
| 📦 **pipx** | Install and run Python applications in isolated environments |
| 🔧 **apk restored** | Alpine package manager available for additional packages |
| 🚀 **Ready to use** | Works exactly like the official n8n image |

---

## 🚀 Quick Start

### Basic Run Command

**Linux / macOS:**

```bash
docker run -it --name py3-n8n -p 5678:5678 -v n8n_data:/home/node/.n8n himalerangana/py3-n8n
```

**Windows PowerShell:**

```powershell
docker run -it --name py3-n8n -p 5678:5678 -v n8n_data:/home/node/.n8n himalerangana/py3-n8n
```

Then open [http://localhost:5678](http://localhost:5678) in your browser.

---

### Full Run Command with All Options

**Linux / macOS:**

```bash
docker run -it \
  --name py3-n8n \
  -p 5678:5678 \
  -e GENERIC_TIMEZONE="Asia/Colombo" \
  -e TZ="Asia/Colombo" \
  -e N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true \
  -e N8N_RUNNERS_ENABLED=true \
  -e NODES_EXCLUDE="[]" \
  -v n8n_data:/home/node/.n8n \
  -v /path/to/your/files:/home/node/.n8n-files \
  himalerangana/py3-n8n
```

**Windows PowerShell:**

```powershell
docker run -it `
  --name py3-n8n `
  -p 5678:5678 `
  -e GENERIC_TIMEZONE="Asia/Colombo" `
  -e TZ="Asia/Colombo" `
  -e N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true `
  -e N8N_RUNNERS_ENABLED=true `
  -e NODES_EXCLUDE="[]" `
  -v n8n_data:/home/node/.n8n `
  --mount type=bind,src="C:\path\to\your\files",target=/home/node/.n8n-files `
  himalerangana/py3-n8n
```

> 📁 **Note:** The bind mount (`--mount type=bind` or `-v /host/path:/container/path`) for local files is **optional**. It's useful when you want to access local files from within n8n workflows. See [Docker Bind Mounts Documentation](https://docs.docker.com/engine/storage/bind-mounts/) for more details.

> 🌍 **Timezone:** Find your timezone value from the [IANA Time Zone Database](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List).

---

## 💻 Using Environment Variables in Docker Commands

Environment variables in Docker commands are specified with `-e VAR_NAME="value"`. However, the syntax for using **system environment variables** differs across terminals:

| Terminal | Syntax | Example |
|----------|--------|---------|
| **Linux / macOS (Bash/Zsh)** | `$VAR_NAME` or `${VAR_NAME}` | `-v $HOME/files:/home/node/.n8n-files` |
| **Windows PowerShell** | `$env:VAR_NAME` | `--mount type=bind,src="$env:USERPROFILE\files",target=/home/node/.n8n-files` |
| **Windows CMD** | `%VAR_NAME%` | `--mount type=bind,src="%USERPROFILE%\files",target=/home/node/.n8n-files` |

### Examples

**Linux / macOS:**

```bash
docker run -it -v "$HOME/my-files:/home/node/.n8n-files" himalerangana/py3-n8n
```

**Windows PowerShell:**

```powershell
docker run -it --mount type=bind,src="$env:USERPROFILE\my-files",target=/home/node/.n8n-files himalerangana/py3-n8n
```

**Windows CMD:**

```cmd
docker run -it --mount type=bind,src="%USERPROFILE%\my-files",target=/home/node/.n8n-files himalerangana/py3-n8n
```

---

## 🐍 Using Python in n8n

### Test Python Installation

```bash
# Enter the container
docker exec -it py3-n8n /bin/sh

# Check versions
python3 --version
pip --version

# Install a package
pip install requests

# Use pipx
pipx run cowsay -t "Hello from py3-n8n!"
```

### In n8n Code Node

Use the **Code** node with Python:

```python
import json

result = {"message": "Hello from Python!"}
return json.dumps(result)
```

---

## 📦 Installing Additional Packages

### Python Packages

```bash
pip install pandas numpy requests
```

### System Packages

```bash
# apk is restored! Install any Alpine package
docker exec -u root -it py3-n8n apk add --no-cache ffmpeg
```

---

## 🔧 Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `GENERIC_TIMEZONE` | Timezone for n8n | `UTC` |
| `TZ` | System timezone | `UTC` |
| `N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS` | Enforce file permissions | `false` |
| `N8N_RUNNERS_ENABLED` | Enable task runners | `false` |
| `NODES_EXCLUDE` | Nodes to exclude | `[]` |

See [n8n Environment Variables Documentation](https://docs.n8n.io/hosting/configuration/environment-variables/) for more options.

---

## 🏗️ Build Locally

If you prefer to build the image yourself instead of pulling from Docker Hub:

```bash
git clone https://github.com/HimalEranganaOfficial/py3-n8n.git
cd py3-n8n
docker build -t py3-n8n .
docker run -it -p 5678:5678 py3-n8n
```

---

## 🤔 Why This Image?

The official n8n Docker image uses **Docker Hardened Images** (Alpine-based) which removes the `apk` package manager for security. This makes it impossible to install Python or other packages.

This image solves that by:

1. ✅ Restoring the `apk` package manager using `apk-tools-static`
2. ✅ Installing Python 3, pip, and pipx
3. ✅ Removing PEP 668 restrictions for pip (the `EXTERNALLY-MANAGED` file)
4. ✅ Keeping everything else from the official n8n image

---

## 📁 Project Structure

```
py3-n8n/
├── Dockerfile          # Main Docker image definition
├── README.md           # This file
├── LICENSE             # MIT License
├── .gitignore          # Git ignore rules
└── .dockerignore       # Docker ignore rules
```

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- [n8n](https://n8n.io/) - Workflow automation tool
- [Alpine Linux](https://alpinelinux.org/) - Base Linux distribution
- [Docker](https://www.docker.com/) - Containerization platform

---

## 👥 Contributors

| Avatar | Name | Role | Links |
|--------|------|------|-------|
| <img src="https://avatars.githubusercontent.com/u/62547849?v=4" width="50" height="50" style="border-radius: 50%;" alt="Himal Erangana"> | **Himal Erangana** | Developer & Maintainer | [![GitHub](https://img.shields.io/badge/GitHub-181717?logo=github&logoColor=white)](https://github.com/HimalEranganaOfficial) [![Linktree](https://img.shields.io/badge/Linktree-43E55E?logo=linktree&logoColor=white)](https://linktr.ee/HimalErangana) |
| <img src="https://cdn.jsdelivr.net/gh/RussianSwornTranslator/RussianSwornTranslator.github.io@latest/images/favicon-512.png" width="50" height="50" style="border-radius: 50%;" alt="Nilan Sankalpa Jayasinghe"> | **B.M.D.N.S. Jayasinghe** | Project Initiator | [![Google Scholar](https://img.shields.io/badge/Google%20Scholar-4285F4?logo=googlescholar&logoColor=white)](https://scholar.google.com/citations?hl=en&authuser=3&user=4Wi9YoQAAAAJ) [![Facebook](https://img.shields.io/badge/Facebook-1877F2?logo=facebook&logoColor=white)](https://www.facebook.com/bmdnsjayasinghe) |

---

<p align="center">
  Made with ❤️ for the n8n community
</p>
