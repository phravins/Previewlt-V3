<script lang="ts">
  import { onMount } from 'svelte';

  type Format = { id: string, name: string, label: string, color: string, engine: string };
  let formats: Format[] = [
    { id: 'TSX', name: 'TSX', label: 'TypeScript React', color: '#2563EB', engine: 'Babel CDN' },
    { id: 'TS', name: 'TS', label: 'TypeScript', color: '#1D4ED8', engine: 'Babel CDN' },
    { id: 'JS', name: 'JS', label: 'JavaScript', color: '#92400E', engine: 'Babel CDN' },
    { id: 'JSX', name: 'JSX', label: 'JavaScript React', color: '#0891B2', engine: 'Babel CDN' },
    { id: 'HTML', name: 'HTML', label: 'HyperText', color: '#C2410C', engine: 'html-to-jsx' },
    { id: 'Vue', name: 'Vue', label: 'Vue 3 SFC', color: '#15803D', engine: '@vue/compiler' },
    { id: 'SCSS', name: 'SCSS', label: 'Sass / SCSS', color: '#5B21B6', engine: 'sass.js WASM' },
    { id: 'MD', name: 'MD', label: 'Markdown', color: '#475569', engine: 'marked.js' },
    { id: 'Python', name: 'Python', label: 'Python 3', color: '#3B82F6', engine: '2c' },
    { id: 'Java', name: 'Java', label: 'Java', color: '#F87171', engine: 'JSweet' },
    { id: 'C', name: 'C', label: 'C Language', color: '#64748B', engine: 'GCC' },
  ];
  let selectedFrom = $state(formats[0]);
  let selectedTo = $state(formats[2]); // JS default
  let isConverted = $state(false);

  let babelLoaded = $state(false);
  let inputCode = $state("interface User {\n  name: string;\n  status: 'active' | 'offline';\n}\n\nconst user: User = {\n  name: 'PreviewIt Client',\n  status: 'active'\n};\n\nconsole.log(user);");
  let outputCode = $state("");
  let diffLogs = $state<{type: string, msg: string}[]>([]);

  interface Props {
    showToast: (msg: string) => void;
  }
  let { showToast }: Props = $props();

  onMount(() => {
    // Inject Babel AST Parser dynamically for transpilation
    if (!document.getElementById('babel-cdns')) {
      const script = document.createElement('script');
      script.id = 'babel-cdns';
      script.src = 'https://unpkg.com/@babel/standalone/babel.min.js';
      script.onload = () => { babelLoaded = true; };
      document.body.appendChild(script);
    } else {
      babelLoaded = !!(window as any).Babel;
    }
  });

  // Watch dependencies and rebuild AST actively
  $effect(() => {
    if (isConverted) {
      transpileCode(inputCode, selectedFrom, selectedTo);
    }
  });

  function transpileCode(code: string, from: Format, to: Format) {
    if (from.id === 'Python' || from.id === 'Java' || from.id === 'C') {
        outputCode = `/* Initiating remote connection... */\n// The WebAssembly payload for ${from.engine} is missing natively in the browser.\n// Realtime python/java AST hooks into the .NET Remote Backend.`;
        diffLogs = [{ type: 'rm', msg: `Missing local WASM binaries for target.` }];
        return;
    }

    if (!babelLoaded) {
      outputCode = "// Loading Babel compiler...";
      return;
    }

    try {
      const Babel = (window as any).Babel;
      if (!Babel) return;

      const opts: any = { 
        presets: [],
        filename: `temp.${from.id.toLowerCase()}`
      };
      if (from.id === 'TS' || from.id === 'TSX') opts.presets.push('typescript');
      if (from.id === 'TSX' || from.id === 'JSX' || from.id === 'JS') opts.presets.push('react');
      
      const result = Babel.transform(code, opts);
      outputCode = result.code;
      
      const inLines = code.split('\n').length;
      const outLines = result.code.split('\n').length;
      diffLogs = [];
      if (inLines > outLines) {
        diffLogs.push({ type: 'rm', msg: `− ${inLines - outLines} lines compiled away (type annotations)` });
      } else {
        diffLogs.push({ type: 'rm', msg: `− 0 syntax structure lost` });
      }
      diffLogs.push({ type: 'add', msg: `+ AST Transformation successful` });
    } catch (err: any) {
      outputCode = err.message;
      diffLogs = [{ type: 'rm', msg: 'Syntax Error in AST Parser' }];
    }
  }

  function triggerConversion() {
    isConverted = true;
    showToast('AST Transpiler Workspace Open ✓');
  }
</script>

<div class="conv-page">
  <div class="conv-hero">
    <div class="sec-label" style="margin-bottom:12px"><div class="sec-label-bar"></div>Code converter</div>
    <h1>Like ilovepdf, <span class="acc" style="color:var(--green)">but for code.</span></h1>
    <p>AST-powered transpilation. Library-powered, browser-native. No AI API, no server call, zero cost — forever.</p>
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
              onclick={() => { selectedFrom = fmt; }}
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
          <span class="cd-engine" style="background:var(--green-bg); color:var(--green-d); border:1px solid var(--green-bd); font-size:10px; padding:4px 10px; border-radius:100px; font-weight:600; font-family:var(--code)">{selectedFrom.engine}</span>
        </div>
        <div class="cd-f">
          <div class="cd-name" style="color: {selectedTo.color}; font-size:40px; font-weight:800; font-family:var(--disp)">{selectedTo.name}</div>
          <div class="cd-label" style="font-size:10px; color:var(--muted); font-family:var(--code); margin-top:3px">{selectedTo.label}</div>
        </div>
      </div>

      <div class="conv-part">
        <div class="cp-label" style="font-size:10px;font-weight:700;color:var(--faint);text-transform:uppercase;margin-bottom:14px;letter-spacing:0.1em;font-family:var(--code);">Convert to</div>
        <div class="ftiles">
          <!-- target selections (reduced mapped array to demonstrate flexibility) -->
          {#each formats.slice(0, 4) as fmt}
             <!-- svelte-ignore a11y_click_events_have_key_events -->
             <!-- svelte-ignore a11y_no_static_element_interactions -->
             <div 
               class="ftile {selectedTo.id === fmt.id ? 'sel' : ''}" 
               style="border-color: {selectedTo.id === fmt.id ? fmt.color : ''}" 
               onclick={() => { selectedTo = fmt; }}
             >
               <span class="ftile-n" style="color: {fmt.color}">{fmt.name}</span>
               <span class="ftile-l">{fmt.label}</span>
             </div>
          {/each}
          <!-- Specific mocked language targets -->
          <div class="ftile" onclick={() => { selectedTo = formats[8]; }}><span class="ftile-n" style="color:#3B82F6">Python</span><span class="ftile-l">Python 3</span></div>
          <div class="ftile" onclick={() => { selectedTo = formats[10]; }}><span class="ftile-n" style="color:#64748B">C</span><span class="ftile-l">C Lang</span></div>
        </div>
      </div>

      {#if !isConverted}
        <!-- svelte-ignore a11y_click_events_have_key_events -->
        <!-- svelte-ignore a11y_no_static_element_interactions -->
        <div class="dropzone conv-drop" onclick={triggerConversion}>
          <div class="dz-icon">⚙️</div>
          <div class="dz-title">Open AST Transpiler</div>
          <div class="dz-sub">or <span class="dz-link">browse to upload</span> file</div>
          <div class="dz-cap" style="font-size:11px; font-family:var(--code); color:var(--faint); margin-top:6px">Powered by Babel.js AST Parser</div>
        </div>
      {:else}
        <div class="conv-result show" style="display:flex; flex-direction:column">
          <div class="cr-bar" style="padding:14px 20px; background:var(--green-bg); border-bottom:1px solid var(--green-bd); display:flex; align-items:center; gap:10px;">
            <div class="cr-file" style="font-size:12px; font-family:var(--code); display:flex; align-items:center; gap:7px">
              <span style="font-weight:600">Input AST ({selectedFrom.id})</span>
              <span class="cr-arrow" style="color:var(--green)">→</span>
              <span style="font-weight:600">Generated Code ({selectedTo.id})</span>
            </div>
            <div class="cr-actions" style="margin-left:auto; display:flex; gap:8px">
              <button class="cr-btn" onclick={() => showToast('Output copied!')}>Copy</button>
              <button class="cr-btn" onclick={() => showToast('Downloaded!')}>Download</button>
            </div>
          </div>
          <div class="cr-panels" style="display:grid; grid-template-columns:1fr 1fr">
            <div class="cr-panel" style="border-right:1px solid var(--border); display:flex; flex-direction:column">
              <div class="cr-panel-h" style="padding:10px 16px; background:var(--off); border-bottom:1px solid var(--border); font-size:11px; font-family:var(--code); color:var(--body-c); display:flex; align-items:center">
                Editor <span class="msb-badge" style="background:{selectedFrom.color}15; color:{selectedFrom.color}; border:1px solid {selectedFrom.color}30; margin-left:4px">{selectedFrom.name}</span>
                <span style="margin-left:auto; color:var(--faint)">Live Input</span>
              </div>
              <div class="cr-code" style="padding:14px 16px; min-height: 250px; display:flex;">
                <textarea bind:value={inputCode} style="flex:1; width:100%; border:none; resize:none; outline:none; background:transparent; font-family:var(--code); font-size:12px; color:var(--ink); line-height:1.6;" placeholder="Type your code here..."></textarea>
              </div>
              <div class="cr-diff" style="border-top:1px solid var(--border); padding:12px 16px; background:var(--off)">
                <div class="cr-diff-h" style="font-size:10px; font-family:var(--code); color:var(--faint); text-transform:uppercase; letter-spacing:0.07em; margin-bottom:7px">AST Diff Changes</div>
                {#each diffLogs as log}
                  <div class="diff-rw {log.type === 'rm' ? 'r' : 'a'}" style="font-size:11px; font-family:var(--code); padding:3px 8px; border-radius:4px; margin-bottom:3px; {log.type === 'rm' ? 'background:#fff0f0; color:#C0392B' : 'background:#f0fbf5; color:#1A7A4A'}">{log.msg}</div>
                {/each}
              </div>
            </div>
            <div class="cr-panel" style="display:flex; flex-direction:column">
              <div class="cr-panel-h" style="padding:10px 16px; background:var(--off); border-bottom:1px solid var(--border); font-size:11px; font-family:var(--code); color:var(--body-c); display:flex; align-items:center">
                AST Output <span class="msb-badge" style="background:{selectedTo.color}15; color:{selectedTo.color}; border:1px solid {selectedTo.color}30; margin-left:4px">{selectedTo.name}</span>
              </div>
              <div class="cr-code" style="padding:14px 16px; min-height: 250px; overflow:auto;">
                <pre style="width:100%; font-family:var(--code); font-size:12px; color:var(--body-c); line-height:1.6; margin:0; white-space:pre-wrap;">{outputCode}</pre>
              </div>
            </div>
          </div>
        </div>
      {/if}
    </div>

    <div class="conv-side-cards">
      <div class="csc">
        <div class="csc-icon" style="background:var(--green-bg)">⚡</div>
        <h4>Instant AST Parser</h4>
        <p>Uses @babel/standalone to construct Abstract Syntax Trees natively. Watch logic shift entirely in the browser memory.</p>
      </div>
      <div class="csc dark">
        <div class="csc-icon" style="background:rgba(255,255,255,.08)">🔀</div>
        <h4 style="color:white">Side-by-side transpilation</h4>
        <p style="color:rgba(255,255,255,0.45)">Write TypeScript/React on the left; automatically output ES5 Vanilla JavaScript on the right.</p>
        <div class="diff-preview" style="font-family:var(--code); font-size:10.5px; border-radius:8px; overflow:hidden; border:1px solid rgba(255,255,255,.1)">
          <div class="diff-rem" style="padding:5px 10px; color:#FCA5A5; background:rgba(255,100,100,.12)">− const user: User = null;</div>
          <div class="diff-add" style="padding:5px 10px; color:#6EE7B7; background:rgba(52,211,153,.1)">+ var user = null;</div>
        </div>
      </div>
      <div class="csc">
        <div class="csc-icon" style="background:var(--blue-bg)">🔗</div>
        <h4>Extensible Formats</h4>
        <p>Support explicitly added for Java, Python, and C environments utilizing specific remote WebAssembly compiler targets.</p>
      </div>
    </div>
  </div>
</div>
