const fs = require('fs');
const path = require('path');

function walk(dir) {
  const files = fs.readdirSync(dir);
  for (const file of files) {
    if (file === 'node_modules' || file === '.git' || file === 'dist' || file.startsWith('.bun')) continue;
    const fullPath = path.join(dir, file);
    // skip binary files or non-utf8 readable if any, but in gstack mostly src
    if (fullPath.endsWith('.png') || fullPath.endsWith('.jpg')) continue;
    
    if (fs.statSync(fullPath).isDirectory()) {
      walk(fullPath);
    } else {
      let content;
      try {
          content = fs.readFileSync(fullPath, 'utf8');
      } catch (e) { continue; }
      
      let changed = false;
      if (content.includes('.gemini')) {
        content = content.replace(/\.gemini/g, '.gemini');
        changed = true;
      }
      if (content.includes('Gemini CLI')) {
        content = content.replace(/Gemini CLI/g, 'Gemini CLI');
        changed = true;
      }
      if (content.includes('Gemini')) {
        content = content.replace(/Gemini/g, 'Gemini');
        changed = true;
      }
      if (content.includes('gemini')) {
        content = content.replace(/gemini/g, 'gemini');
        changed = true;
      }
      if (content.includes('Gemini+gstack')) {
        content = content.replace(/CC\+gstack/g, 'Gemini+gstack');
        changed = true;
      }
      if (content.includes(' Gemini CLI ')) {
        content = content.replace(/ Gemini CLI /g, ' Gemini CLI ');
        changed = true;
      }
      if (content.includes('Gemini:')) {
        content = content.replace(/Gemini:/g, 'Gemini:');
        changed = true;
      }
      if (content.includes('ask_user tool')) {
        content = content.replace(/ask_user tool/g, 'ask_user tool');
        changed = true;
      }
      if (changed) {
        fs.writeFileSync(fullPath, content);
      }
    }
  }
}

walk('.');
