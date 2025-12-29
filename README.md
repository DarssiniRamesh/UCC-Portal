<p align="center">
  <img src="https://cdn.discordapp.com/attachments/1045298870533509130/1068425329909174392/egg_-_Copy-modified.png" width="200" height="200">
  <h1 align="center"><b>UCC Student Portal</b></h1>
</p>

<p align="center">
  <a aria-label="Follow PP Namias on Twitter" href="https://twitter.com/PP_Namias" target="_blank"><img alt="" src="https://img.shields.io/badge/Follow%20@PP_Namias-black.svg?style=for-the-badge&logo=Twitter"></a>
  <a aria-label="Follow PP Namias on Github" href="https://github.com/PP-Namias" target="_blank"><img alt="" src="https://img.shields.io/badge/Follow%20@PP_Namias-black.svg?style=for-the-badge&logo=Github"></a>
  <br>
  <a href="https://github.com/PP-Namias/UCC-Student-Portal" target="blank"><img src="https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square" alt="UCC Student Portal All Contributors" /></a>
  <a href="https://github.com/PP-Namias/UCC-Student-Portal/blob/master/LICENSE" target="blank"><img src="https://img.shields.io/github/license/PP-Namias/UCC-Student-Portal?style=flat-square" alt="UCC Student Portal license" /></a>
  <a href="https://github.com/PP-Namias/UCC-Student-Portal/fork" target="blank"><img src="https://img.shields.io/github/forks/PP-Namias/UCC-Student-Portal?style=flat-square" alt="UCC Student Portal forks"/></a>
  <a href="https://github.com/PP-Namias/UCC-Student-Portal/stargazers" target="blank"><img src="https://img.shields.io/github/stars/PP-Namias/UCC-Student-Portal?style=flat-square" alt="UCC Student Portal stars"/></a>
  <a href="https://github.com/PP-Namias/UCC-Student-Portal/issues" target="blank"><img src="https://img.shields.io/github/issues/PP-Namias/UCC-Student-Portal?style=flat-square" alt="UCC Student Portal issues"/></a>
  <a href="https://github.com/PP-Namias/UCC-Student-Portal/pulls" target="blank"><img src="https://img.shields.io/github/issues-pr/PP-Namias/UCC-Student-Portal?style=flat-square" alt="UCC Student Portal pull-requests"/></a>
  <p align="center">
      Welcome to the UCC Student Portal login page! This is a front-end design for a web application designed to provide students of the University of Caloocan City (UCC) with a centralized platform for accessing academic and administrative services.
    <br />
    <br />
    <a href="https://github.com/PP-Namias/UCC-Student-Portal/issues">Report Bug</a>
    ·
    <a href="https://github.com/PP-Namias/UCC-Student-Portal/issues">Request Feature</a>
  </p>
</p>

<!-- ABOUT THE PROJECT -->
## <img src="https://cdn.discordapp.com/emojis/859424401186095114.png" width="20px" height="20px"> 》Description
[![Readme Card](https://github-readme-stats.vercel.app/api/pin/?username=PP-Namias&repo=UCC-Student-Portal&theme=tokyonight&show_owner=true&hide_border=true)](https://github.com/PP-Namias/UCC-Student-Portal)

## <img src="https://cdn.discordapp.com/emojis/852881450667081728.gif" width="20px" height="20px"> 》Feature
The UCC Student Portal login page provides the following features:
- [x] <b>Login and Authentication</b>: Students can securely login to the portal using their UCC credentials, which are verified using a secure authentication mechanism.

## <img src="https://cdn.discordapp.com/emojis/1028680849195020308.png" width="25px" height="25px"> 》Screenshots
<br />
<p align="center">
  <a href="https://github.com/PP-Namias/UCC-Student-Portal">
    <img src="./assets/UCC_Student_Portal.png">
  </a>
</p>

## E2E Testing with Cypress
This project includes end-to-end tests using Cypress.

Prerequisites:
- Ensure the site is available locally at http://localhost:3000 (serve the UCC-Portal directory with your preferred static server).
  - Example: npm run serve (uses http-server) or any other static server of your choice.
- Build CSS from SCSS before serving (required for CI and local):
  - npm run build:css  (default safe wrapper that installs sass if needed; falls back to precompiled css/index.fallback.css if sass is unavailable)
  - or: npm run build:css:safe
  - If your CI calls `sass scss/index.scss css/index.css` directly and cannot be changed:
    - Add repo root to PATH so the local shim is found first:
      - export PATH="$PWD:$PATH" && sass scss/index.scss css/index.css
      (ensure the repo root is first in PATH so the local ./sass wrapper is used)
    - Alternatively: npm install && ./node_modules/.bin/sass scss/index.scss css/index.css

Install dependencies:
- From UCC-Portal directory, run: npm install

Build CSS:
- npm run build:css (uses a safe wrapper)
- To watch during development: npm run watch:css
- In CI environments, you can run the helper script to install and build in one step:
  - bash scripts/ci-build.sh

Run tests interactively:
- npm run cypress:open

Run tests headlessly:
- npm run cypress:run

Notes:
- The tests assume the DOM structure found in index.html (e.g., .portal__wrapper__hero, form.portal__wrapper__form, #studno, #acode, #captcha, #show-hide-pass, #captcha-img).
- If you change selectors or structure, update the specs under cypress/e2e accordingly.

## ✨》Donate
By Donating, You Will Help Me To Maintain This Project 
- [Patreon](https://www.patreon.com/PP_Namias)
- [Ko-fi](https://ko-fi.com/PP_Namias)

## 🔐 》License
Distributed under the MIT License. See [`LICENSE`](https://github.com/PP-Namias/UCC-Student-Portal/blob/main/LICENSE) for more information.
