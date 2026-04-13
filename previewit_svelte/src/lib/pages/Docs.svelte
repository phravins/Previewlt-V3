<script lang="ts">
  const docsData: Record<string, {title: string, content: string}> = {
    intro: { title: 'Introduction', content: `
      <h1>Welcome to PreviewIt</h1>
      <p>PreviewIt is a browser-native developer tool for instantly previewing and converting web code files — no installation, no configuration, no build steps required.</p>
      <div class="docs-alert"><span class="docs-alert-icon">✓</span><span>All processing happens in your browser. Your code never leaves your machine.</span></div>
      <h2>What is PreviewIt?</h2>
      <p>PreviewIt solves a real developer frustration: spinning up a project just to see how a component looks. Drop a file, see it rendered in a browser frame, tablet, or iPhone mockup — in under 300ms.</p>
      <h2>Two core features</h2>
      <ul>
        <li><strong>Preview tool</strong> — Upload HTML, JSX, TSX, Vue, JS, SCSS, Markdown, SVG. Renders live in desktop, tablet, or mobile device frames.</li>
        <li><strong>Code converter</strong> — 14 conversion paths. TSX → JSX, HTML → JSX, SCSS → CSS, MD → HTML, and more. All library-powered, all instant, all free.</li>
      </ul>
      <h2>Built on a lean stack</h2>
      <ul>
        <li>Frontend: <code>Svelte 5 + UI</code> with SCSS design tokens</li>
        <li>Backend: <code>.NET Web API</code></li>
        <li>CDN libraries: Babel, Vue, marked.js, html-to-jsx — loaded lazily per format</li>
      </ul>
    `},
    quickstart: { title: 'Quick start', content: `
      <h1>Quick start</h1>
      <p>Get up and running with PreviewIt in under 30 seconds.</p>
      <h2>Step 1 — Open the preview tool</h2>
      <p>Navigate to the <strong>Preview</strong> page from the top navigation, or click <strong>Get started</strong> in the navbar.</p>
      <h2>Step 2 — Drop your file</h2>
      <p>Drag any web code file directly onto the canvas area.</p>
    `},
    formats: { title: 'Supported formats', content: `
      <h1>Supported formats</h1>
      <p>PreviewIt supports 9 file types for preview and 14 conversion paths for the converter.</p>
      <ul>
        <li><code>HTML / HTM</code> — Rendered directly. Full page or fragment.</li>
        <li><code>JSX</code> — Transpiled via Babel standalone CDN. React 18 auto-mounted.</li>
        <li><code>TSX</code> — Same as JSX with TypeScript preset added.</li>
        <li><code>Vue</code> — Vue 3 global CDN injected. Auto-mounted to <code>#app</code>.</li>
        <li><code>JS</code> — Vanilla JavaScript with <code>#app</code> div provided.</li>
        <li><code>CSS / SCSS</code> — Demo HTML elements rendered with your styles.</li>
        <li><code>Markdown</code> — Converted to HTML via marked.js with GFM support.</li>
      </ul>
    `},
    converter: { title: 'How the converter works', content: `
      <h1>How the converter works</h1>
      <p>All conversions are mechanical — powered by the same libraries the original frameworks use. No AI, no server call, zero cost.</p>
    `},
    svelte: { title: 'Svelte + SCSS setup', content: `
      <h1>Svelte + SCSS setup</h1>
      <p>PreviewIt's frontend is built with Svelte and SCSS. Here's how to integrate the design token system.</p>
    `}
  };

  ['upload', 'devices', 'sharing', 'conversions', 'stack', 'phoenix'].forEach(k => {
    if (!docsData[k]) {
      const up = k.charAt(0).toUpperCase() + k.slice(1);
      docsData[k] = {
        title: k, 
        content: "<h1>" + up + "</h1><p>Documentation for <strong>" + k + "</strong> is coming soon.</p><div class='docs-alert'><span class='docs-alert-icon'>🚧</span><span>This section is being written. Check back soon.</span></div>"
      };
    }
  });

  let activeDoc = $state('intro');
</script>

<div class="docs-shell">
  <div class="docs-sb">
    <div class="docs-sb-title">Documentation</div>
    
    <div class="docs-sb-sec">Getting started</div>
    <!-- svelte-ignore a11y_click_events_have_key_events -->
    <!-- svelte-ignore a11y_no_static_element_interactions -->
    <div class="docs-sb-a {activeDoc === 'intro' ? 'on' : ''}" onclick={() => activeDoc = 'intro'}>Introduction</div>
    <div class="docs-sb-a {activeDoc === 'quickstart' ? 'on' : ''}" onclick={() => activeDoc = 'quickstart'}>Quick start</div>
    <div class="docs-sb-a {activeDoc === 'formats' ? 'on' : ''}" onclick={() => activeDoc = 'formats'}>Supported formats</div>
    
    <div class="docs-sb-sec">Preview tool</div>
    <div class="docs-sb-a {activeDoc === 'upload' ? 'on' : ''}" onclick={() => activeDoc = 'upload'}>Uploading files</div>
    <div class="docs-sb-a {activeDoc === 'devices' ? 'on' : ''}" onclick={() => activeDoc = 'devices'}>Device frames</div>
    <div class="docs-sb-a {activeDoc === 'sharing' ? 'on' : ''}" onclick={() => activeDoc = 'sharing'}>Sharing previews</div>
    
    <div class="docs-sb-sec">Code converter</div>
    <div class="docs-sb-a {activeDoc === 'converter' ? 'on' : ''}" onclick={() => activeDoc = 'converter'}>How it works</div>
    <div class="docs-sb-a {activeDoc === 'conversions' ? 'on' : ''}" onclick={() => activeDoc = 'conversions'}>All conversions</div>
    <div class="docs-sb-a {activeDoc === 'stack' ? 'on' : ''}" onclick={() => activeDoc = 'stack'}>Tech stack</div>
    
    <div class="docs-sb-sec">Integration</div>
    <div class="docs-sb-a {activeDoc === 'svelte' ? 'on' : ''}" onclick={() => activeDoc = 'svelte'}>Svelte + SCSS setup</div>
    <div class="docs-sb-a {activeDoc === 'phoenix' ? 'on' : ''}" onclick={() => activeDoc = 'phoenix'}>Backend API</div>
  </div>
  <div class="docs-content">
    {@html docsData[activeDoc].content}
  </div>
</div>
