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
  let selectedFrom = $state(formats[0]);
  let selectedTo = $state(formats[1]);
  let isConverted = $state(false);

  interface Props {
    showToast: (msg: string) => void;
  }
  let { showToast }: Props = $props();

  function triggerConversion() {
    isConverted = true;
    showToast('Conversion complete! ✓');
  }
</script>

<div class="conv-page">
  <div class="conv-hero">
    <div class="sec-label" style="margin-bottom:12px"><div class="sec-label-bar"></div>Code converter</div>
    <h1>Like ilovepdf, <span class="acc" style="color:var(--green)">but for code.</span></h1>
    <p>14 conversion paths. Library-powered, browser-native, instant. No AI API, no server call, zero cost — forever.</p>
  </div>
  
  <div class="conv-grid">
    <div class="conv-card" id="conv-main-card">
      <div class="conv-part">
        <div class="cp-label" style="font-size:10px;font-weight:700;color:var(--faint);text-transform:uppercase;margin-bottom:14px;letter-spacing:0.1em;font-family:var(--code);">Convert from</div>
        <div class="ftiles">
          {#each formats as fmt}
            <!-- svelte-ignore a11y_click_events_have_key_events -->
            <!-- svelte-ignore a11y_no_static_element_interactions -->
            <div 
              class="ftile {selectedFrom.id === fmt.id ? 'sel' : ''}" 
              style="border-color: {selectedFrom.id === fmt.id ? fmt.color : ''}; box-shadow: {selectedFrom.id === fmt.id ? '0 4px 14px ' + fmt.color + '25' : ''}" 
              onclick={() => { selectedFrom = fmt; isConverted = false; }}
            >
              <span class="ftile-n" style="color: {fmt.color}">{fmt.name}</span>
              <span class="ftile-l">{fmt.label}</span>
            </div>
          {/each}
        </div>
      </div>
      
      <div class="conv-disp">
        <div class="cd-f">
          <div class="cd-name" style="color: {selectedFrom.color}; font-size:40px; font-weight:800; font-family:var(--disp)">{selectedFrom.name}</div>
          <div class="cd-label" style="font-size:10px; color:var(--muted); font-family:var(--code); margin-top:3px">{selectedFrom.label}</div>
        </div>
        <div class="cd-mid" style="display:flex;flex-direction:column;align-items:center;gap:6px">
          <span class="cd-arr" style="color:var(--green); font-size:22px; font-weight:700">⟶</span>
          <span class="cd-engine" style="background:var(--green-bg); color:var(--green-d); border:1px solid var(--green-bd); font-size:10px; padding:4px 10px; border-radius:100px; font-weight:600; font-family:var(--code)">{selectedFrom.engine} · instant · free</span>
        </div>
        <div class="cd-f">
          <div class="cd-name" style="color: {selectedTo.color}; font-size:40px; font-weight:800; font-family:var(--disp)">{selectedTo.name}</div>
          <div class="cd-label" style="font-size:10px; color:var(--muted); font-family:var(--code); margin-top:3px">{selectedTo.label}</div>
        </div>
      </div>

      <div class="conv-part">
        <div class="cp-label" style="font-size:10px;font-weight:700;color:var(--faint);text-transform:uppercase;margin-bottom:14px;letter-spacing:0.1em;font-family:var(--code);">Convert to</div>
        <div class="ftiles">
          <!-- svelte-ignore a11y_click_events_have_key_events -->
          <!-- svelte-ignore a11y_no_static_element_interactions -->
          <div class="ftile dis" style="opacity:0.35"><span class="ftile-n">TSX</span><span class="ftile-l">same format</span></div>
          <!-- svelte-ignore a11y_click_events_have_key_events -->
          <!-- svelte-ignore a11y_no_static_element_interactions -->
          <div class="ftile sel" style="border-color:#0891B2" onclick={() => { selectedTo = formats[1]; isConverted = false; }}><span class="ftile-n" style="color:#0891B2">JSX</span><span class="ftile-l">JavaScript React</span></div>
          <!-- svelte-ignore a11y_click_events_have_key_events -->
          <!-- svelte-ignore a11y_no_static_element_interactions -->
          <div class="ftile" onclick={() => { selectedTo = formats[5]; isConverted = false; }}><span class="ftile-n" style="color:#92400E">JS</span><span class="ftile-l">JavaScript</span></div>
          <!-- svelte-ignore a11y_click_events_have_key_events -->
          <!-- svelte-ignore a11y_no_static_element_interactions -->
          <div class="ftile" onclick={() => { selectedTo = formats[2]; isConverted = false; }}><span class="ftile-n" style="color:#C2410C">HTML</span><span class="ftile-l">HyperText</span></div>
        </div>
      </div>

      {#if !isConverted}
        <!-- svelte-ignore a11y_click_events_have_key_events -->
        <!-- svelte-ignore a11y_no_static_element_interactions -->
        <div class="dropzone conv-drop" onclick={triggerConversion}>
          <div class="dz-icon">↑</div>
          <div class="dz-title">Drop your file here</div>
          <div class="dz-sub">or <span class="dz-link">browse to upload</span></div>
          <div class="dz-cap" style="font-size:11px; font-family:var(--code); color:var(--faint); margin-top:6px">max 2MB · .tsx .jsx .html .vue .scss .md</div>
        </div>
      {:else}
        <div class="conv-result show" style="display:flex; flex-direction:column">
          <div class="cr-bar" style="padding:14px 20px; background:var(--green-bg); border-bottom:1px solid var(--green-bd); display:flex; align-items:center; gap:10px;">
            <div class="cr-file" style="font-size:12px; font-family:var(--code); display:flex; align-items:center; gap:7px">
              <span style="font-weight:600">App.{selectedFrom.id.toLowerCase()}</span>
              <span class="cr-arrow" style="color:var(--green)">→</span>
              <span style="font-weight:600">App.{selectedTo.id.toLowerCase()}</span>
            </div>
            <div class="cr-actions" style="margin-left:auto; display:flex; gap:8px">
              <button class="cr-btn" onclick={() => showToast('Output copied!')}>Copy</button>
              <button class="cr-btn" onclick={() => showToast('Downloaded!')}>Download</button>
              <button class="cr-btn" style="background:var(--green);color:#fff;border-color:var(--green)">Open in Preview →</button>
            </div>
          </div>
          <div class="cr-panels" style="display:grid; grid-template-columns:1fr 1fr">
            <div class="cr-panel" style="border-right:1px solid var(--border); display:flex; flex-direction:column">
              <div class="cr-panel-h" style="padding:10px 16px; background:var(--off); border-bottom:1px solid var(--border); font-size:11px; font-family:var(--code); color:var(--body-c); display:flex; align-items:center">
                Input <span class="msb-badge" style="background:{selectedFrom.color}15; color:{selectedFrom.color}; border:1px solid {selectedFrom.color}30; margin-left:4px">{selectedFrom.name}</span>
                <span style="margin-left:auto; color:var(--faint)">8 lines</span>
              </div>
              <div class="cr-code" style="padding:14px 0; max-height:320px; overflow:auto">
                <div class="code-ln rm" style="display:flex; line-height:1.65; background:#fff0f0; color:#C0392B"><span class="ln-num" style="width:40px; text-align:right; padding-right:10px; font-family:var(--code); font-size:11px; color:var(--faint)">1</span><span class="ln-c" style="font-family:var(--code); font-size:11px">const name: string = 'App';</span></div>
                <div class="code-ln" style="display:flex; line-height:1.65;"><span class="ln-num" style="width:40px; text-align:right; padding-right:10px; font-family:var(--code); font-size:11px; color:var(--faint)">2</span><span class="ln-c" style="font-family:var(--code); font-size:11px">return &lt;div&gt;Hello {name}&lt;/div&gt;;</span></div>
              </div>
              <div class="cr-diff" style="border-top:1px solid var(--border); padding:12px 16px; background:var(--off)">
                <div class="cr-diff-h" style="font-size:10px; font-family:var(--code); color:var(--faint); text-transform:uppercase; letter-spacing:0.07em; margin-bottom:7px">Changes</div>
                <div class="diff-rw r" style="font-size:11px; font-family:var(--code); padding:3px 8px; border-radius:4px; margin-bottom:3px; background:#fff0f0; color:#C0392B">− 1 type annotation(s) removed</div>
                <div class="diff-rw a" style="font-size:11px; font-family:var(--code); padding:3px 8px; border-radius:4px; margin-bottom:3px; background:#f0fbf5; color:#1A7A4A">+ Logic 100% preserved</div>
              </div>
            </div>
            <div class="cr-panel" style="display:flex; flex-direction:column">
              <div class="cr-panel-h" style="padding:10px 16px; background:var(--off); border-bottom:1px solid var(--border); font-size:11px; font-family:var(--code); color:var(--body-c); display:flex; align-items:center">
                Output <span class="msb-badge" style="background:{selectedTo.color}15; color:{selectedTo.color}; border:1px solid {selectedTo.color}30; margin-left:4px">{selectedTo.name}</span>
                <span style="margin-left:auto; color:var(--faint)">8 lines</span>
              </div>
              <div class="cr-code" style="padding:14px 0; max-height:320px; overflow:auto">
                <div class="code-ln" style="display:flex; line-height:1.65;"><span class="ln-num" style="width:40px; text-align:right; padding-right:10px; font-family:var(--code); font-size:11px; color:var(--faint)">1</span><span class="ln-c" style="font-family:var(--code); font-size:11px">const name = 'App';</span></div>
                <div class="code-ln" style="display:flex; line-height:1.65;"><span class="ln-num" style="width:40px; text-align:right; padding-right:10px; font-family:var(--code); font-size:11px; color:var(--faint)">2</span><span class="ln-c" style="font-family:var(--code); font-size:11px">return &lt;div&gt;Hello {name}&lt;/div&gt;;</span></div>
              </div>
            </div>
          </div>
        </div>
      {/if}
    </div>

    <div class="conv-side-cards">
      <div class="csc">
        <div class="csc-icon" style="background:var(--green-bg)">⚡</div>
        <h4>Instant, always</h4>
        <p>All conversions run in your browser using the exact same libraries the original frameworks use. Zero waiting, zero queuing, zero rate limits.</p>
      </div>
      <div class="csc dark">
        <div class="csc-icon" style="background:rgba(255,255,255,.08)">🔀</div>
        <h4 style="color:white">Side-by-side diff</h4>
        <p style="color:rgba(255,255,255,0.45)">See exactly what changed. Every removed type annotation highlighted in red, every addition in green.</p>
        <div class="diff-preview" style="font-family:var(--code); font-size:10.5px; border-radius:8px; overflow:hidden; border:1px solid rgba(255,255,255,.1)">
          <div class="diff-rem" style="padding:5px 10px; color:#FCA5A5; background:rgba(255,100,100,.12)">− const name: string = 'Phravin'</div>
          <div class="diff-add" style="padding:5px 10px; color:#6EE7B7; background:rgba(52,211,153,.1)">+ const name = 'Phravin'</div>
        </div>
      </div>
      <div class="csc">
        <div class="csc-icon" style="background:var(--blue-bg)">🔗</div>
        <h4>Open in preview</h4>
        <p>After converting, send the output to the Preview tool with one click. Convert and preview in a single flow.</p>
      </div>
    </div>
  </div>
</div>
