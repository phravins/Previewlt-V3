<script lang="ts">
    import { onMount } from 'svelte';
    
    let isScrolled = $state(false);

    onMount(() => {
        const onScroll = () => {
            isScrolled = window.scrollY > 20;
        };
        window.addEventListener('scroll', onScroll, { passive: true });
        return () => window.removeEventListener('scroll', onScroll);
    });
</script>

<nav id="nav" class:scrolled={isScrolled}>
  <a class="nav-logo" href="#">
    <div class="nav-mark">
      <svg viewBox="0 0 18 18"><polyline points="3,9 7,13 15,5"/></svg>
    </div>
    <span class="nav-wordmark">PreviewIt</span>
  </a>
  <div class="nav-links">
    <a href="#" class="nav-link active">Home</a>
    <a href="#" class="nav-link">Preview</a>
    <a href="#" class="nav-link">Convert</a>
    <a href="#" class="nav-link">Docs</a>
    <a href="#" class="nav-link">GitHub</a>
  </div>
  <div class="nav-right">
    <div class="nav-pill"><div class="nav-pill-dot"></div>v1.0 beta</div>
    <button class="btn-sign">Sign in</button>
    <button class="btn-start">Get started <span class="arr">→</span></button>
  </div>
</nav>
