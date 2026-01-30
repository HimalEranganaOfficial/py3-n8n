# 🐍 py3-n8n

[![Docker](https://img.shields.io/badge/Docker-Ready-blue?logo=docker)](https://www.docker.com/)
[![n8n](https://img.shields.io/badge/n8n-Workflow%20Automation-orange)](https://n8n.io/)
[![Python](https://img.shields.io/badge/Python-3.12-green?logo=python)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> **n8n workflow automation with full Python 3 support**

A custom Docker image that extends the official [n8n](https://n8n.io/) image with Python 3, pip, and pipx pre-installed. Perfect for running Python scripts within your n8n workflows!

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🐍 **Python 3.12** | Full Python installation |
| 📦 **pip** | Python package installer (no restrictions) |
| 📦 **pipx** | Install and run Python applications in isolated environments |
| 🔧 **apk restored** | Alpine package manager available for additional packages |
| 🚀 **Ready to use** | Works exactly like the official n8n image |

---

## 🚀 Quick Start

### Option 1: Using Docker Run

```bash
docker build -t py3-n8n .

docker run -it \
  --name py3-n8n \
  -p 5678:5678 \
  -v n8n_data:/home/node/.n8n \
  py3-n8n
```

Then open http://localhost:5678 in your browser.

### Option 2: Using Docker Compose

```bash
docker-compose up -d
```

---

## 📋 Full Docker Run Command

### Linux / macOS

```bash
docker run -it \
  --name py3-n8n \
  -p 5678:5678 \
  -e GENERIC_TIMEZONE="Asia/Colombo" \
  -e TZ="Asia/Colombo" \
  -e N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true \
  -e N8N_RUNNERS_ENABLED=true \
  -v n8n_data:/home/node/.n8n \
  -v /path/to/your/files:/home/node/.n8n-files \
  py3-n8n
```

### Windows PowerShell

```powershell
docker run -it `
  --name py3-n8n `
  -p 5678:5678 `
  -e GENERIC_TIMEZONE="Asia/Colombo" `
  -e TZ="Asia/Colombo" `
  -e N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true `
  -e N8N_RUNNERS_ENABLED=true `
  -v n8n_data:/home/node/.n8n `
  --mount type=bind,src="C:\path\to\your\files",target=/home/node/.n8n-files `
  py3-n8n
```

---

## 🐍 Using Python in n8n

### Test Python Installation

```bash
# Enter the container
docker exec -it py3-n8n /bin/sh

# Check Python version
python3 --version

# Install a package
pip install requests

# Use pipx
pipx install cowsay
```

### In n8n Code Node

Use the **Code** node with Python:

```python
import json

# Your Python code here
result = {"message": "Hello from Python!"}

return json.dumps(result)
```

---

## 📦 Installing Additional Packages

### Python Packages

```bash
# Using pip
pip install pandas numpy requests

# Using pipx (for CLI tools)
pipx install black
pipx install poetry
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

See [n8n documentation](https://docs.n8n.io/hosting/configuration/environment-variables/) for more options.

---

## 🏗️ Build Locally

```bash
# Clone the repository
git clone https://github.com/HimalEranganaOfficial/py3-n8n.git
cd py3-n8n

# Build the image
docker build -t py3-n8n .

# Run
docker run -it -p 5678:5678 py3-n8n
```

---

## 📁 Project Structure

```
py3-n8n/
├── Dockerfile          # Main Docker image definition
├── docker-compose.yml  # Docker Compose configuration
├── README.md           # This file
├── LICENSE             # MIT License
├── .gitignore          # Git ignore rules
└── .dockerignore       # Docker ignore rules
```

---

## 🤔 Why This Image?

The official n8n Docker image uses **Docker Hardened Images** (Alpine-based) which removes the `apk` package manager for security. This makes it impossible to install Python or other packages.

This image solves that by:

1. ✅ Restoring the `apk` package manager using `apk-tools-static`
2. ✅ Installing Python 3, pip, and pipx
3. ✅ Removing PEP 668 restrictions for pip
4. ✅ Keeping everything else from the official n8n image

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- [n8n](https://n8n.io/) - Workflow automation tool
- [Alpine Linux](https://alpinelinux.org/) - Base Linux distribution
- [Docker](https://www.docker.com/) - Containerization platform

---

## 👤 Author

**Himal Erangana**

- GitHub: [@HimalEranganaOfficial](https://github.com/HimalEranganaOfficial)

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/HimalEranganaOfficial">Himal Erangana</a>
</p>
