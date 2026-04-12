<script lang="ts">
  import { onMount } from 'svelte';
  
  let statsRef: HTMLElement;
  let s1Count = $state(0);

  onMount(() => {
    const io = new IntersectionObserver(([e]) => {
      if(!e.isIntersecting) return;
      let s: number | null = null;
      const target = 14;
      const step = (ts: number) => {
        if(!s) s = ts;
        const p = Math.min((ts - s) / 900, 1);
        s1Count = Math.round((1 - Math.pow(1 - p, 3)) * target);
        if(p < 1) requestAnimationFrame(step);
      };
      requestAnimationFrame(step);
      io.unobserve(statsRef);
    },{ threshold: .5 });
    
    if (statsRef) io.observe(statsRef);
    return () => io.disconnect();
  });
</script>

<div class="stats-section">
  <div class="stats-inner">
    <div class="stat-cell reveal" bind:this={statsRef}>
      <div class="stat-val">{s1Count}<span class="s">+</span></div>
      <div class="stat-label">Supported formats across preview and conversion</div>
    </div>
    <div class="stat-cell reveal d1">
      <div class="stat-val">&lt;300<span class="s">ms</span></div>
      <div class="stat-label">Average render time from file drop to live preview</div>
    </div>
    <div class="stat-cell reveal d2">
      <div class="stat-val">0<span class="s">kb</span></div>
      <div class="stat-label">Runtime overhead — Svelte compiles to pure vanilla JS</div>
    </div>
    <div class="stat-cell reveal d3">
      <div class="stat-val">$0<span class="s">/mo</span></div>
      <div class="stat-label">Cost for all conversions — browser-native libraries only</div>
    </div>
  </div>
</div>
