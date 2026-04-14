<script lang="ts">
  import { getContext } from 'svelte';
  
  let hmc = $state(8);
  let scaleStyle = $state("");
  
  let showAiModal = $state(false);
  let apiKey = $state("");

  const changePage = getContext<((page: string) => void)>('changePage');

  function adjustHmc(delta: number) {
    hmc = Math.max(0, hmc + delta);
    scaleStyle = "transform: scale(1.2)";
    setTimeout(() => {
      scaleStyle = "";
    }, 200);
  }
</script>

<div style="max-width:1200px;margin:0 auto;padding:0 40px">
  <div class="hero" style="max-width:none;padding:72px 0 80px">
    <div>
      <div class="hero-tag reveal">
        <div class="hero-tag-icon">✓</div>
        <span>Zero install · Zero config · 100% free</span>
      </div>
      <h1 class="hero-title reveal d1">
        Preview web code<br>
        <span class="accent">instantly.</span><br>
        <span class="muted-word">No setup.</span>
      </h1>
      <p class="hero-sub reveal d2">
        Drop any <strong>HTML, JSX, TSX, Vue, Svelte</strong> file and see it rendered live — inside a browser frame, tablet, or phone mockup. No npm, no terminal, no waiting.
      </p>
      <div class="hero-ctas reveal d2">
        <button class="hero-cta-p" onclick={() => changePage('get-started')}>Open preview tool →</button>
        <button class="hero-cta-s" onclick={() => showAiModal = true}>✦ Try the converter</button>
      </div>
      <div class="hero-social reveal d3">
        <div class="h-avs">
          <div class="h-av" style="background:#00C07A">PR</div>
          <div class="h-av" style="background:#4A90E2">SK</div>
          <div class="h-av" style="background:#8B5CF6">AM</div>
          <div class="h-av" style="background:#F59E0B">RK</div>
          <div class="h-av" style="background:#EC4899">VN</div>
        </div>
        <span class="h-social-txt"><strong>3,200+</strong> developers weekly</span>
        <div class="h-divider"></div>
        <div class="h-stars">
          <span class="h-star">★</span><span class="h-star">★</span><span class="h-star">★</span><span class="h-star">★</span><span class="h-star">★</span>
          <span class="h-rating-txt" style="margin-left:4px">4.9 on Product Hunt</span>
        </div>
      </div>
    </div>
    <div class="hero-mockup-wrap reveal d2">
      <div class="f-chip c1">
        <div class="f-chip-ic" style="background:var(--green-bg)">⚡</div>
        <div>
          <div class="f-chip-v">284ms</div>
          <div class="f-chip-l">render time</div>
        </div>
      </div>
      <div class="f-chip c2">
        <div class="f-chip-ic" style="background:var(--blue-bg)">🔒</div>
        <div>
          <div class="f-chip-v">100% private</div>
          <div class="f-chip-l">browser-only</div>
        </div>
      </div>
      <div class="hero-mockup">
        <div class="hm-chrome">
          <div class="hm-dots">
            <div class="hm-dot" style="background:#FF5F57"></div>
            <div class="hm-dot" style="background:#FEBC2E"></div>
            <div class="hm-dot" style="background:#28C840"></div>
          </div>
          <div class="hm-url">localhost · PreviewIt</div>
          <div class="hm-actions">
            <div class="hm-act-btn">↺</div>
            <div class="hm-act-btn">Share</div>
          </div>
        </div>
        <div class="hm-body">
          <div class="hm-sidebar">
            <div class="hms-section">Files</div>
            <div class="hms-file on">
              <div class="hms-dot" style="background:#2563EB"></div>
              App.tsx
              <span class="hms-badge tsx-bg tsx-c tsx-bd" style="border:1px solid">TSX</span>
            </div>
            <div class="hms-file">
              <div class="hms-dot" style="background:#5B21B6"></div>
              styles.scss
              <span class="hms-badge scss-bg scss-c scss-bd" style="border:1px solid">SCSS</span>
            </div>
            <div class="hms-file">
              <div class="hms-dot" style="background:#C2410C"></div>
              index.html
              <span class="hms-badge html-bg html-c html-bd" style="border:1px solid">HTML</span>
            </div>
            <div class="hms-file">
              <div class="hms-dot" style="background:#1D4ED8"></div>
              utils.ts
              <span class="hms-badge ts-bg ts-c ts-bd" style="border:1px solid">TS</span>
            </div>
            <div style="margin:auto 8px 8px;border:1.5px dashed var(--border);border-radius:var(--r-sm);padding:6px;text-align:center;font-size:9px;font-family:var(--code);color:var(--faint);cursor:pointer">+ add files</div>
          </div>
          <div class="hm-preview">
            <div class="hm-ctr">
              <div class="hm-ctr-num" style={scaleStyle}>{hmc}</div>
              <div class="hm-ctr-lbl">interactions</div>
              <div class="hm-ctr-btns">
                <button class="hm-ctr-btn" onclick={() => adjustHmc(-1)}>−</button>
                <button class="hm-ctr-btn" onclick={() => adjustHmc(1)}>+</button>
              </div>
            </div>
          </div>
        </div>
        <div class="hm-foot">
          <div class="hm-status-dot"></div>
          <span class="hm-status-txt">App.tsx · React · Babel 7.23 · rendered in 284ms</span>
        </div>
      </div>
    </div>
  </div>
</div>

{#if showAiModal}
  <div class="modal-overlay">
    <div class="modal-box">
      <div class="modal-icon">✨</div>
      <h3 class="modal-title">AI Conversion Engine</h3>
      <p class="modal-desc">To unlock advanced AI-powered language-to-language translation paths, please enter your secure API Key.</p>
      
      <input 
        type="password" 
        class="modal-input" 
        placeholder="Enter API Key (e.g. sk-...)" 
        bind:value={apiKey}
      />
      
      <div class="modal-actions">
        <button class="modal-btn cancel" onclick={() => showAiModal = false}>Cancel</button>
        <button class="modal-btn continue" onclick={() => { showAiModal = false; changePage('get-started'); }}>Authorize & Continue →</button>
      </div>
    </div>
  </div>
{/if}

<style>
  .modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0,0,0,0.4);
    backdrop-filter: blur(4px);
    -webkit-backdrop-filter: blur(4px);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 9999;
    animation: fadeIn 0.2s ease;
  }
  
  .modal-box {
    background: #fff;
    width: 100%;
    max-width: 420px;
    padding: 30px;
    border-radius: 16px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.15);
    border: 1px solid rgba(0,0,0,0.05);
    animation: slideUp 0.3s cubic-bezier(0.16, 1, 0.3, 1);
  }
  
  :global(.dark-theme) .modal-box {
    background: #111;
    border-color: rgba(255,255,255,0.1);
    box-shadow: 0 20px 40px rgba(0,0,0,0.5);
  }

  .modal-icon {
    font-size: 24px;
    margin-bottom: 12px;
  }

  .modal-title {
    font-size: 20px;
    font-family: var(--disp);
    font-weight: 700;
    margin-bottom: 8px;
    color: var(--ink);
  }
  
  .modal-desc {
    font-size: 14px;
    color: var(--muted);
    line-height: 1.5;
    margin-bottom: 24px;
  }

  .modal-input {
    width: 100%;
    padding: 12px 16px;
    font-family: var(--code);
    font-size: 13px;
    border: 1px solid var(--bdr);
    border-radius: 8px;
    background: var(--off);
    color: var(--ink);
    margin-bottom: 24px;
    outline: none;
    transition: 0.2s;
  }
  
  .modal-input:focus {
    border-color: var(--green);
    background: #fff;
    box-shadow: 0 0 0 3px rgba(0, 192, 122, 0.15);
  }
  
  :global(.dark-theme) .modal-input:focus {
    background: #000;
  }

  .modal-actions {
    display: flex;
    justify-content: flex-end;
    gap: 12px;
  }

  .modal-btn {
    padding: 10px 18px;
    font-size: 13px;
    font-weight: 600;
    border-radius: 8px;
    cursor: pointer;
    transition: 0.2s;
    border: none;
    font-family: var(--disp);
  }

  .modal-btn.cancel {
    background: transparent;
    color: var(--muted);
  }
  
  .modal-btn.cancel:hover {
    color: var(--ink);
    background: rgba(0,0,0,0.05);
  }
  
  :global(.dark-theme) .modal-btn.cancel:hover {
    background: rgba(255,255,255,0.05);
  }

  .modal-btn.continue {
    background: var(--green);
    color: #fff;
    box-shadow: 0 4px 12px rgba(0, 192, 122, 0.25);
  }
  
  .modal-btn.continue:hover {
    filter: brightness(1.1);
  }

  @keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
  }

  @keyframes slideUp {
    from { transform: translateY(20px); opacity: 0; }
    to { transform: translateY(0); opacity: 1; }
  }
</style>
