<script lang="ts">
  import { getContext } from 'svelte';
  const changePage = getContext<((page: string) => void)>('changePage');
</script>

<footer>
  <a class="foot-logo" href="#">
    <div class="nav-mark" style="width:28px;height:28px">
      <svg viewBox="0 0 18 18" style="width:13px;height:13px;fill:none;stroke:white;stroke-width:2;stroke-linecap:round;stroke-linejoin:round">
        <polyline points="3,9 7,13 15,5"/>
      </svg>
    </div>
    <span class="nav-wordmark" style="font-size:14px">PreviewIt</span>
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
