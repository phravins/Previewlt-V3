<script lang="ts">
  import { getContext } from 'svelte';
  import Logo from './Logo.svelte';
  const changePage = getContext<((page: string) => void)>('changePage');
</script>

<footer>
  <a class="foot-logo" href="#" onclick={() => changePage('home')} style="display: flex; align-items: center; margin-bottom: 24px;">
    <Logo style="height: 24px; width: auto; color: var(--ink);" />
  </a>
  <div class="foot-links">
    <!-- svelte-ignore a11y_invalid_attribute -->
    <a href="javascript:void(0)" class="foot-link" onclick={() => changePage('get-started')}>Preview</a>
    <!-- svelte-ignore a11y_invalid_attribute -->
    <a href="javascript:void(0)" class="foot-link" onclick={() => changePage('get-started')}>Converter</a>
    <!-- svelte-ignore a11y_invalid_attribute -->
    <a href="javascript:void(0)" class="foot-link" onclick={() => changePage('docs')}>Docs</a>
    <a href="https://github.com/phravins/Previewlt-V3" target="_blank" rel="noopener noreferrer" class="foot-link">GitHub</a>
    <!-- svelte-ignore a11y_invalid_attribute -->
    <a href="javascript:void(0)" class="foot-link" onclick={() => changePage('changelog')}>Changelog</a>
    <!-- svelte-ignore a11y_invalid_attribute -->
    <a href="javascript:void(0)" class="foot-link" onclick={() => changePage('privacy')}>Privacy</a>
  </div>
  <div class="foot-copy">© 2025 PreviewIt · MIT Licensed</div>
</footer>
