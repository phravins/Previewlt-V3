<script lang="ts">
  import { getContext } from 'svelte';
  const changePage = getContext<((page: string) => void)>('changePage');
</script>

<div class="cta-section">
  <div class="cta-card reveal">
    <div class="cta-bg"></div>
    <div class="cta-dots"></div>
    <div class="cta-left">
      <div class="cta-tag">
        <div style="width:6px;height:6px;border-radius:50%;background:var(--green)"></div>Free forever · No account needed
      </div>
      <h2 class="cta-h">Start previewing<br>in <span class="accent">10 seconds</span> flat.</h2>
      <p class="cta-p">No install. No config. No waiting. Drop your file and see it live — right now, right here, in your browser.</p>
    </div>
    <div class="cta-right">
      <button class="cta-btn-p" onclick={() => changePage('get-started')}>Open PreviewIt free →</button>
      <button class="cta-btn-s">View documentation</button>
      <div class="cta-note">MIT licensed · Built in India 🇮🇳</div>
    </div>
  </div>
</div>
