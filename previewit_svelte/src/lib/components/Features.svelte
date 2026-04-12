<script lang="ts">
  interface Props {
    showToast: (msg: string) => void;
  }
  let { showToast }: Props = $props();
</script>

<div class="section" style="padding-top:0">
  <div class="sec-head-grid">
    <div>
      <div class="sec-tag reveal"><div class="sec-tag-line"></div>Features</div>
      <h2 class="sec-h2 reveal d1">Everything you need,<br><span class="clr">nothing extra.</span></h2>
    </div>
    <p class="sec-sub reveal d2">Built for developers who value their time. Every feature is purposeful. Every interaction is instant.</p>
  </div>
  <div class="feat-grid reveal">
    <div class="feat-card">
      <div class="feat-card-body">
        <h3>Live device preview</h3>
        <p>See your code rendered inside a realistic browser frame, tablet, or iPhone 15 Pro. One click to switch between all three — the preview updates instantly without reloading.</p>
        <div style="display:flex;gap:8px;flex-wrap:wrap">
          <span class="hms-badge" style="font-size:11px;padding:4px 10px;border-radius:6px;background:var(--green-bg);color:var(--green-d);border:1px solid var(--green-bd)">Desktop</span>
          <span class="hms-badge" style="font-size:11px;padding:4px 10px;border-radius:6px;background:var(--blue-bg);color:var(--blue);border:1px solid #BFDBFE">Tablet</span>
          <span class="hms-badge" style="font-size:11px;padding:4px 10px;border-radius:6px;background:var(--purple-bg);color:var(--purple);border:1px solid #DDD6FE">iPhone 15 Pro</span>
        </div>
      </div>
      <div class="feat-card-vis">
        <div class="mini-devices">
          <div class="mini-browser">
            <div class="mini-browser-chrome">
              <div class="mini-b-dot" style="background:#FF5F57"></div>
              <div class="mini-b-dot" style="background:#FEBC2E"></div>
              <div class="mini-b-dot" style="background:#28C840"></div>
            </div>
            <div class="mini-browser-body" style="height:calc(100% - 18px)">
              <div style="font-family:var(--disp);font-size:28px;font-weight:800;color:var(--green)">8</div>
            </div>
          </div>
          <div class="mini-phone">
            <div class="mini-phone-di"></div>
            <div class="mini-phone-screen">
              <div style="font-family:var(--disp);font-size:22px;font-weight:800;color:var(--green)">8</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="feat-grid-col" style="display:flex;flex-direction:column;gap:16px">
      <div class="feat-card">
        <div class="feat-card-body" style="padding:22px">
          <h3 style="font-size:18px">Multi-file support</h3>
          <p style="font-size:13px;margin-bottom:10px">Upload JSX + SCSS + assets together. CSS is auto-injected into every preview. Full file tree sidebar.</p>
          <div class="file-tree">
            <div class="ft-row">
              <div class="ft-dot" style="background:#2563EB"></div>
              <span class="ft-name">App.tsx</span>
              <span style="font-size:8px;padding:2px 6px;border-radius:4px;border:1px solid;" class="tsx-bg tsx-c tsx-bd">TSX</span>
              <span class="ft-size">4.2 KB</span>
            </div>
            <div class="ft-row">
              <div class="ft-dot" style="background:#5B21B6"></div>
              <span class="ft-name">styles.scss</span>
              <span style="font-size:8px;padding:2px 6px;border-radius:4px;" class="scss-bg scss-c">SCSS</span>
              <span class="ft-size">1.1 KB</span>
            </div>
            <div class="ft-row" style="border-bottom:none">
              <div class="ft-dot" style="background:#C2410C"></div>
              <span class="ft-name">index.html</span>
              <span style="font-size:8px;padding:2px 6px;border-radius:4px;" class="html-bg html-c">HTML</span>
              <span class="ft-size">0.8 KB</span>
            </div>
          </div>
        </div>
      </div>
      <div class="feat-card">
        <div class="feat-card-body" style="padding:22px">
          <h3 style="font-size:18px">Share in one click</h3>
          <p style="font-size:13px;margin-bottom:10px">Generate a shareable link instantly. Anyone can view your preview — no account, no friction, no expiry.</p>
          <div class="share-row" style="margin:0;border-radius:var(--r-md);border:1px solid var(--green-bd)">
            <span class="share-url">previewit.app/s/xK7p2mNq</span>
            <span class="share-copy" onclick={() => showToast('Link copied!')} role="button" tabindex="0" onkeydown={(e) => { if(e.key === 'Enter') showToast('Link copied!') }}>Copy ↗</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
