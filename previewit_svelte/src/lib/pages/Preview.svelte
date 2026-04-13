<script lang="ts">
  let activeMode = $state('desktop');
  let activeFile = $state('App.tsx');
  let files = $state([
    { name: 'App.tsx', type: 'TSX', format: 'React TSX', color: '#2563EB' },
    { name: 'styles.scss', type: 'SCSS', format: 'SCSS', color: '#5B21B6' },
    { name: 'index.html', type: 'HTML', format: 'HTML5', color: '#C2410C' }
  ]);
  let isUploadOpen = $state(false);
  let isDragging = $state(false);

  function setMode(m: string) { activeMode = m; }
</script>

<div class="tool-shell">
  <!-- Sidebar -->
  <div class="tool-sb">
    <div class="tsb-nav" style="padding: 16px 8px 8px;">
      <div class="tsb-a on tsb-a-icon-wrap"><span class="tsb-a-icon">⬜</span> Preview</div>
    </div>
    <div class="tsb-sec">Files</div>
    <div id="file-list">
      {#each files as f}
        <!-- svelte-ignore a11y_click_events_have_key_events -->
        <!-- svelte-ignore a11y_no_static_element_interactions -->
        <div class="file-item {activeFile === f.name ? 'on' : ''}" onclick={() => activeFile = f.name}>
          <div class="fi-dot" style="background:{f.color}"></div>
          <span class="fi-name">{f.name}</span>
          <span class="fi-badge {f.type.toLowerCase()}-bg {f.type.toLowerCase()} {f.type.toLowerCase()}-bd">{f.type}</span>
        </div>
      {/each}
    </div>
    <div class="tsb-add" onclick={() => alert('Upload feature coming soon!')}>+ add files</div>
    <div class="tsb-bottom"><div class="tsb-info">{files.length} files · ~2KB</div></div>
  </div>

  <!-- Main -->
  <div class="tool-main">
    <div class="tool-bar">
      <div class="tool-bc"><span>Preview</span><span class="bc-sep">/</span><span class="bc-cur">{activeFile}</span></div>
      <div class="mode-group">
        <button class="mode-btn {activeMode === 'desktop' ? 'on' : ''}" onclick={() => setMode('desktop')}>🖥 Desktop</button>
        <button class="mode-btn {activeMode === 'tablet' ? 'on' : ''}" onclick={() => setMode('tablet')}>📱 Tablet</button>
        <button class="mode-btn {activeMode === 'mobile' ? 'on' : ''}" onclick={() => setMode('mobile')}>📲 Mobile</button>
      </div>
      <div class="tool-bar-r" style="margin-left: auto;">
        <!-- svelte-ignore a11y_click_events_have_key_events -->
        <!-- svelte-ignore a11y_no_static_element_interactions -->
        <div class="tb-btn" title="Refresh">↺</div>
        <!-- svelte-ignore a11y_click_events_have_key_events -->
        <!-- svelte-ignore a11y_no_static_element_interactions -->
        <div class="tb-btn" title="Upload" onclick={() => isUploadOpen = !isUploadOpen}>↑</div>
        <button class="tb-share" onclick={() => alert('Copied share link!')}>Share ↗</button>
      </div>
    </div>

    {#if isUploadOpen}
      <div class="upload-panel show">
        <div class="up-title">Upload files</div>
        <div class="up-sub">Drop files or click to browse</div>
        <!-- svelte-ignore a11y_no_static_element_interactions -->
        <!-- svelte-ignore a11y_click_events_have_key_events -->
        <div class="up-zone" onclick={() => alert('File open dialog opened!')}>
          <div style="font-size:28px;margin-bottom:8px">↑</div>
          <div style="font-size:13px;font-weight:600;margin-bottom:4px">Drop files here</div>
          <div style="font-size:12px;color:var(--muted)">or click to browse</div>
        </div>
      </div>
    {/if}

    <div class="tool-canvas" ondragover={(e) => { e.preventDefault(); isDragging = true; }} ondragleave={() => isDragging = false}>
      <div class="canvas-bg"></div>
      
      <div class="device-wrap">
        {#if activeMode === 'desktop'}
          <div class="frame-desktop">
            <div class="fd-chrome">
              <div class="fd-dots"><div class="fd-dot" style="background:#FF5F57"></div><div class="fd-dot" style="background:#FEBC2E"></div><div class="fd-dot" style="background:#28C840"></div></div>
              <div class="fd-url">{activeFile} · PreviewIt</div>
            </div>
            <div class="fd-body">
              <div class="empty-state">
                <div class="es-icon">🖥</div>
                <div class="es-title">{activeFile} Live Preview</div>
                <div class="es-sub">Ready to render in Desktop view.</div>
              </div>
            </div>
          </div>
          <div class="dev-label">Desktop · 1280px</div>
        {:else if activeMode === 'tablet'}
          <div class="frame-tablet">
            <div class="fd-chrome">
              <div class="fd-dots"><div class="fd-dot" style="background:#FF5F57"></div><div class="fd-dot" style="background:#FEBC2E"></div><div class="fd-dot" style="background:#28C840"></div></div>
              <div class="fd-url">Tablet · 768px</div>
            </div>
            <div class="fd-body" style="background:linear-gradient(140deg, #edfaf3, #fff8f5); display: flex; align-items:center; justify-content:center; color:#888;">
              Rendered Result
            </div>
          </div>
          <div class="dev-label">Tablet · 768px</div>
        {:else if activeMode === 'mobile'}
          <div class="frame-phone">
            <div class="dynamic-island"></div>
            <div class="fd-body" style="background:linear-gradient(140deg, #edfaf3, #fff8f5); display: flex; align-items:center; justify-content:center; color:#888;">
              <span style="transform:translateY(-100px)">Mobile Result</span>
            </div>
          </div>
          <div class="dev-label">Mobile · 375px</div>
        {/if}
      </div>
    </div>

    <!-- Status bar -->
    <div class="tool-status">
      <div class="ts-item"><div class="ts-dot" style="background:var(--green); width:6px; height:6px; border-radius:50%"></div> <span>{activeFile}</span></div>
      <div class="ts-item"><span class="ts-sep">·</span><span>Format Auto-detected</span></div>
      <div class="ts-item"><span class="ts-sep">·</span><span>Ready</span></div>
      <div class="ts-item" style="margin-left:auto"><span>{activeMode}</span></div>
    </div>
  </div>
</div>
