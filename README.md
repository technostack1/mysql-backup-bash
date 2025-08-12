# mysql-backup-bash
A lightweight, production-ready Bash script to automate MySQL/MariaDB backups, compress them, and push to a GitHub repository. Perfect for developers, sysadmins, and DevOps engineers who need a simple, cron-friendly solution.


# MySQL Backup Bash

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
![Shell Script](https://img.shields.io/badge/Bash-Script-blue)
[![PRs Welcome](https://img.shields.io/badge/PRs-Welcome-brightgreen.svg)](https://github.com/<yourusername>/mysql-backup-bash/pulls)

A lightweight, production-ready **Bash script** to automate MySQL/MariaDB backups, compress them, and push them to a GitHub repository.  
Perfect for developers, sysadmins, and DevOps engineers who need a **simple, cron-friendly** solution.

---

## 🚀 Features

- 🔐 **Secure** — Reads DB credentials from a file (`/opt/secret/cred`)
- 🗄 **Organized** — Timestamped backup file names
- 📦 **Efficient** — Compresses dumps into `.zip` archives
- 📤 **Automated** — Commits & pushes backups to a GitHub repo
- 🕒 **Scheduled** — Works seamlessly with `cron`
- 💡 **Lightweight** — Minimal dependencies

---

## 📂 Folder Structure

