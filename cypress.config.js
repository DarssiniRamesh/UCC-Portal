const { defineConfig } = require('cypress');

module.exports = defineConfig({
  e2e: {
    // Base URL where the static site is served. Ensure the server runs before tests.
    baseUrl: process.env.CYPRESS_BASE_URL || 'http://localhost:3000',
    specPattern: 'cypress/e2e/**/*.cy.{js,jsx,ts,tsx}',
    supportFile: 'cypress/support/e2e.js',
    video: false,
    viewportWidth: 1000,
    viewportHeight: 800
  }
});
