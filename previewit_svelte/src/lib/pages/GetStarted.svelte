<script lang="ts">
  import Preview from './Preview.svelte';
  import Convert from './Convert.svelte';

  let mode = $state('preview'); // 'preview' or 'convert'

  interface Props {
    showToast: (msg: string) => void;
  }
  let { showToast }: Props = $props();
</script>

<div class="workspace-page" style="height: calc(100vh - 62px); display: flex; flex-direction: column;">
  <div class="workspace-header">
    <button class="mode-tgl {mode === 'preview' ? 'on' : ''}" onclick={() => mode = 'preview'}>Preview Tool</button>
    <button class="mode-tgl {mode === 'convert' ? 'on' : ''}" onclick={() => mode = 'convert'}>Code Converter</button>
  </div>
  <div class="workspace-body">
    {#if mode === 'preview'}
      <Preview />
    {:else}
      <Convert {showToast} />
    {/if}
  </div>
</div>

<style>
  .workspace-header {
    height: 48px;
    border-bottom: 1px solid var(--bdr);
    background: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    flex-shrink: 0;
  }
  
  :global(.dark-theme) .workspace-header {
    background: transparent;
  }

  .workspace-body {
    flex: 1;
    overflow: auto;
    display: flex;
    flex-direction: column;
  }

  /* Override component absolute height to fit inside the workspace grid */
  :global(.tool-shell) {
    height: 100% !important; 
  }

  .mode-tgl {
    padding: 6px 14px;
    font-size: 13px;
    border: none;
    border-radius: 6px;
    background: transparent;
    cursor: pointer;
    font-family: var(--disp);
    color: var(--muted);
    transition: 0.15s;
  }
  .mode-tgl.on {
    background: var(--off);
    color: var(--ink);
    font-weight: 600;
  }
  .mode-tgl:hover:not(.on) {
    color: var(--body-c);
    background: #fcfcfc;
  }
  
  :global(.dark-theme) .mode-tgl:hover:not(.on) {
    background: rgba(255,255,255,0.02);
  }
</style>
