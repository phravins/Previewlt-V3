<div class="comp-section">
  <div class="sec-head-grid">
    <div>
      <div class="sec-tag reveal"><div class="sec-tag-line"></div>Performance</div>
      <h2 class="sec-h2 reveal d1">Stop waiting for<br><span class="clr">local builds.</span></h2>
    </div>
    <p class="sec-sub reveal d2">Standard dev servers were built for full applications. PreviewIt is built for developers who need to iterate on a single component right now.</p>
  </div>

  <div class="comp-bars reveal d3">
    <div class="comp-bar-row">
      <div class="comp-label">Vite / Next.js Setup</div>
      <div class="comp-bar-track">
        <div class="comp-bar vite" style="width: 85%"></div>
        <span class="comp-time">4.2s</span>
      </div>
    </div>
    <div class="comp-bar-row">
      <div class="comp-label">PreviewIt Instant</div>
      <div class="comp-bar-track">
        <div class="comp-bar previewit" style="width: 8%"></div>
        <span class="comp-time">284ms</span>
      </div>
    </div>
  </div>

  <div class="comp-table-wrap reveal d4">
    <table class="comp-table">
      <thead>
        <tr>
          <th>Capability</th>
          <th>Standard Workflow</th>
          <th class="highlight">PreviewIt Way</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Setup Time</td>
          <td>~2-5 mins (npm install)</td>
          <td class="highlight">0 seconds (Just drop)</td>
        </tr>
        <tr>
          <td>RAM Usage</td>
          <td>500MB - 1GB+</td>
          <td class="highlight">~12MB (Browser-native)</td>
        </tr>
        <tr>
          <td>Hot Reload</td>
          <td>500ms - 2000ms</td>
          <td class="highlight">&lt; 100ms</td>
        </tr>
        <tr>
          <td>Privacy</td>
          <td>Disk-based server</td>
          <td class="highlight">100% In-memory</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

<style>
  /* Local component styles or relies on app.scss */
</style>
