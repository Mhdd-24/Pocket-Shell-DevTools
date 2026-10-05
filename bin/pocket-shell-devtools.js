#!/usr/bin/env node
/**
 * Prints the installed loader path (dot-source in PowerShell profile).
 */
import { fileURLToPath } from 'node:url';
import path from 'node:path';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const loader = path.join(root, 'pocket-shell-devtools.ps1');

console.log('Pocket Shell DevTools');
console.log('');
console.log('PowerShell profile:');
console.log(`  . '${loader.replace(/'/g, "''")}'`);
console.log('');
console.log('Or run:');
console.log(`  pwsh -File "${path.join(root, 'scripts', 'install-profile.ps1')}"`);
console.log('');
console.log('Then: psh-help | reload');
