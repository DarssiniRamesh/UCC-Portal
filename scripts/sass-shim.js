#!/usr/bin/env node
/**
 * Node-based shim to run Sass via npx so environments without global sass can still compile.
 * Forwards all args to `npx sass`.
 */
const { spawn } = require('child_process');

function run() {
  const args = process.argv.slice(2);
  const npx = process.platform === 'win32' ? 'npx.cmd' : 'npx';

  const child = spawn(npx, ['sass', ...args], {
    stdio: 'inherit',
    shell: false,
  });

  child.on('exit', (code) => {
    process.exit(code ?? 1);
  });
  child.on('error', (err) => {
    console.error('Failed to run npx sass:', err);
    process.exit(127);
  });
}

run();
