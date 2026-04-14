<script lang="ts">
  import Logo from '../components/Logo.svelte';
</script>

<div class="page page-signin active" style="min-height: calc(100vh - 140px); display:flex; align-items:center; justify-content:center; padding: 40px;">
  <div class="signin-card">
    <div style="display: flex; justify-content: center; margin-bottom: 24px;">
      <Logo style="height: 32px; width: auto; color: var(--ink);" />
    </div>
    <h2>Welcome back</h2>
    <p>Sign in to your PreviewIt account to sync your conversion history and save your custom API keys natively.</p>
    
    <div class="s-auth-methods">
      <button class="s-btn github">
        <svg viewBox="0 0 24 24" width="18" height="18" fill="currentColor" style="margin-right:8px;"><path d="M12 .297c-6.63 0-12 5.373-12 12 0 5.303 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61C4.422 18.07 3.633 17.7 3.633 17.7c-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 22.092 24 17.592 24 12.297c0-6.627-5.373-12-12-12"/></svg>
        Sign in with GitHub
      </button>
      
      <div class="s-div"><span>OR</span></div>
      
      <input type="email" class="s-input" placeholder="Email address" />
      <input type="password" class="s-input" placeholder="Password" />
      <button class="s-btn primary">Continue with Email</button>
    </div>
    
    <div class="s-foot">
      Don't have an account? <a href="#">Sign up</a>
    </div>
  </div>
</div>

<style>
  .signin-card {
    background: #fff;
    width: 100%;
    max-width: 380px;
    padding: 40px;
    border-radius: 20px;
    box-shadow: 0 10px 40px rgba(0,0,0,0.06);
    border: 1px solid var(--bdr);
    text-align: center;
  }
  
  :global(.dark-theme) .signin-card {
    background: #0A0A0A;
    box-shadow: 0 10px 40px rgba(0,0,0,0.5);
  }

  .signin-card h2 {
    font-family: var(--disp);
    font-size: 22px;
    font-weight: 700;
    color: var(--ink);
    margin-bottom: 8px;
  }
  
  .signin-card p {
    font-size: 13px;
    color: var(--muted);
    line-height: 1.5;
    margin-bottom: 30px;
  }
  
  .s-auth-methods {
    display: flex;
    flex-direction: column;
    gap: 12px;
    margin-bottom: 30px;
  }
  
  .s-btn {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    padding: 12px;
    font-family: var(--disp);
    font-size: 13px;
    font-weight: 600;
    border-radius: 8px;
    cursor: pointer;
    border: none;
    transition: 0.2s;
  }
  
  .s-btn.github {
    background: var(--ink);
    color: var(--bg);
    border: 1px solid var(--ink);
  }
  
  :global(.dark-theme) .s-btn.github {
    background: #222;
    border-color: #333;
    color: #fff;
  }
  
  .s-btn.primary {
    background: var(--green);
    color: #fff;
    box-shadow: 0 4px 12px rgba(0, 192, 122, 0.25);
  }
  
  .s-btn.primary:hover {
    filter: brightness(1.05);
  }

  .s-div {
    display: flex;
    align-items: center;
    text-align: center;
    color: var(--faint);
    font-size: 11px;
    font-family: var(--code);
    margin: 8px 0;
  }
  .s-div::before, .s-div::after {
    content: '';
    flex: 1;
    border-bottom: 1px solid var(--border);
  }
  .s-div span {
    padding: 0 10px;
  }

  .s-input {
    width: 100%;
    padding: 12px 14px;
    font-family: var(--code);
    font-size: 13px;
    border: 1px solid var(--bdr);
    border-radius: 8px;
    background: var(--off);
    color: var(--ink);
    outline: none;
    transition: 0.2s;
  }
  
  .s-input:focus {
    border-color: var(--green);
    background: #fff;
    box-shadow: 0 0 0 3px rgba(0, 192, 122, 0.15);
  }
  
  :global(.dark-theme) .s-input:focus {
    background: #000;
  }
  
  .s-foot {
    font-size: 13px;
    color: var(--muted);
  }
  .s-foot a {
    color: var(--green);
    font-weight: 600;
  }
</style>
