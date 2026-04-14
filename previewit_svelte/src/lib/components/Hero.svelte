<script lang="ts">
  import { getContext } from 'svelte';
  
  let hmc = $state(8);
  let scaleStyle = $state("");

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
        <button class="hero-cta-s" onclick={() => changePage('get-started')}>✦ Try the converter</button>
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
