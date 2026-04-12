<script lang="ts">
  type Format = { id: string, name: string, label: string, color: string, engine: string };
  let formats: Format[] = [
    { id: 'TSX', name: 'TSX', label: 'TypeScript React', color: '#2563EB', engine: 'Babel CDN' },
    { id: 'JSX', name: 'JSX', label: 'JavaScript React', color: '#0891B2', engine: 'Babel CDN' },
    { id: 'HTML', name: 'HTML', label: 'HyperText', color: '#C2410C', engine: 'html-to-jsx' },
    { id: 'Vue', name: 'Vue', label: 'Vue 3 SFC', color: '#15803D', engine: '@vue/compiler' },
    { id: 'TS', name: 'TS', label: 'TypeScript', color: '#1D4ED8', engine: 'TS compiler' },
    { id: 'JS', name: 'JS', label: 'JavaScript', color: '#92400E', engine: 'Babel CDN' },
    { id: 'SCSS', name: 'SCSS', label: 'Sass / SCSS', color: '#5B21B6', engine: 'sass.js WASM' },
    { id: 'MD', name: 'MD', label: 'Markdown', color: '#475569', engine: 'marked.js' },
  ];
  let selected = $state(formats[0]);
  interface Props {
    showToast: (msg: string) => void;
  }
  let { showToast }: Props = $props();
</script>

<div class="conv-section">
  <div class="sec-head-grid">
    <div>
      <div class="sec-tag reveal"><div class="sec-tag-line"></div>Code converter</div>
      <h2 class="sec-h2 reveal d1">Like ilovepdf,<br><span class="clr">but for code.</span></h2>
    </div>
    <p class="sec-sub reveal d2">14 conversion paths. All library-powered, all browser-native, all instant. No AI API, no server call, zero cost — forever.</p>
  </div>
  <div class="conv-grid reveal">
    <div class="conv-card">
      <div class="conv-part">
        <div class="conv-part-label">Convert from</div>
        <div class="ftiles">
          {#each formats as fmt}
            <!-- svelte-ignore a11y_click_events_have_key_events -->
            <!-- svelte-ignore a11y_no_static_element_interactions -->
            <div 
              class="ftile {selected.id === fmt.id ? 'sel' : ''}" 
              style="border-color: {selected.id === fmt.id ? fmt.color : ''}; box-shadow: {selected.id === fmt.id ? '0 4px 14px ' + fmt.color + '25' : ''}" 
              onclick={() => selected = fmt}
            >
              <span class="ftile-n" style="color: {fmt.color}">{fmt.name}</span>
              <span class="ftile-l">{fmt.label}</span>
            </div>
          {/each}
        </div>
      </div>
      <div class="conv-display">
        <div class="cd-fmt">
          <div class="cd-name" style="color: {selected.color}">{selected.name}</div>
          <div class="cd-label">{selected.label}</div>
        </div>
        <div class="cd-center">
          <span class="cd-arrow">⟶</span>
          <span class="cd-engine free">{selected.engine} · instant · free</span>
        </div>
        <div class="cd-fmt">
          <div class="cd-name" style="color: #0891B2">JSX</div>
          <div class="cd-label">JavaScript React</div>
        </div>
      </div>
      <!-- svelte-ignore a11y_click_events_have_key_events -->
      <!-- svelte-ignore a11y_no_static_element_interactions -->
      <div class="dropzone" onclick={() => showToast('Upload feature — connect to your Svelte app!')}>
        <div class="dz-icon">↑</div>
        <div class="dz-title">Drop your file here</div>
        <div class="dz-sub">or <span class="dz-link">browse to upload</span></div>
        <div class="dz-cap">max 2MB · .tsx .ts .jsx .js .html .vue .scss .md</div>
      </div>
    </div>
    <div class="conv-side-cards">
      <div class="csc">
        <div class="csc-icon" style="background:var(--green-bg)">⚡</div>
        <h4>Instant, always</h4>
        <p>All conversions run in your browser using the exact same libraries the original frameworks use. Zero waiting, zero queuing, zero rate limits.</p>
        <div style="display:flex;gap:6px;flex-wrap:wrap">
          <span style="font-size:11px;font-weight:600;font-family:var(--code);padding:3px 8px;border-radius:5px;background:var(--green-bg);color:var(--green-d)">browser-native</span>
          <span style="font-size:11px;font-weight:600;font-family:var(--code);padding:3px 8px;border-radius:5px;background:var(--amber-bg);color:var(--amber)">zero latency</span>
        </div>
      </div>
      <div class="csc dark">
        <div class="csc-icon" style="background:rgba(255,255,255,.08)">🔀</div>
        <h4>Side-by-side diff</h4>
        <p>See exactly what changed between input and output. Every removed type annotation, every renamed attribute — shown clearly.</p>
        <div class="diff-preview">
          <div class="diff-rem">− const name: string = 'Phravin'</div>
          <div class="diff-add">+ const name = 'Phravin'</div>
        </div>
      </div>
      <div class="csc">
        <div class="csc-icon" style="background:var(--blue-bg)">🔗</div>
        <h4>Open in preview</h4>
        <p>After converting, send the output directly to the Preview tool with one click. Convert and preview in a single seamless flow.</p>
      </div>
    </div>
  </div>
</div>
