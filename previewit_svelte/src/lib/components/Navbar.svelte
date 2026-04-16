<script lang="ts">
    import { onMount, getContext } from 'svelte';
    import Logo from './Logo.svelte';
    
    let isScrolled = $state(false);
    let isDark = $state(false);

    interface Props {
      activePage?: string;
    }
    let { activePage = 'home' }: Props = $props();

    const changePage = getContext<((page: string) => void)>('changePage');

    function toggleTheme() {
      isDark = !isDark;
      if (isDark) {
        document.body.classList.add('dark-theme');
      } else {
        document.body.classList.remove('dark-theme');
      }
    }

    onMount(() => {
        const onScroll = () => {
            isScrolled = window.scrollY > 20;
        };
        window.addEventListener('scroll', onScroll, { passive: true });
        return () => window.removeEventListener('scroll', onScroll);
    });
</script>

<nav id="nav" class:scrolled={isScrolled}>
  <a class="nav-logo" href="#" onclick={() => changePage('home')} style="display: flex; align-items: center;">
    <Logo style="height: 28px; width: auto; color: var(--ink);" />
  </a>
  <div class="nav-links">
    <!-- svelte-ignore a11y_missing_attribute -->
    <!-- svelte-ignore a11y_click_events_have_key_events -->
    <!-- svelte-ignore a11y_no_static_element_interactions -->
    <a class="nav-link {activePage === 'home' ? 'active' : ''}" onclick={() => changePage('home')}>Home</a>
    <!-- svelte-ignore a11y_missing_attribute -->
    <!-- svelte-ignore a11y_click_events_have_key_events -->
    <!-- svelte-ignore a11y_no_static_element_interactions -->
    <a class="nav-link {activePage === 'docs' ? 'active' : ''}" onclick={() => changePage('docs')}>Docs</a>
    <!-- svelte-ignore a11y_missing_attribute -->
    <!-- svelte-ignore a11y_click_events_have_key_events -->
    <!-- svelte-ignore a11y_no_static_element_interactions -->
    <a class="nav-link {activePage === 'changelog' ? 'active' : ''}" onclick={() => changePage('changelog')}>Changelog</a>
    <a class="nav-link" href="https://github.com/phravins/Previewlt-V3" target="_blank" rel="noopener noreferrer">GitHub</a>
  </div>
  <div class="nav-right">
    <button class="theme-toggle" aria-label="Toggle theme" onclick={toggleTheme}>
      {#if isDark}
        <!-- Sun icon -->
        <svg viewBox="0 0 24 24" width="16" height="16" stroke="currentColor" stroke-width="2.5" fill="none" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="5"></circle><line x1="12" y1="1" x2="12" y2="3"></line><line x1="12" y1="21" x2="12" y2="23"></line><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"></line><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"></line><line x1="1" y1="12" x2="3" y2="12"></line><line x1="21" y1="12" x2="23" y2="12"></line><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"></line><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"></line></svg>
      {:else}
        <!-- Moon icon -->
        <svg viewBox="0 0 24 24" width="16" height="16" stroke="currentColor" stroke-width="2.5" fill="none" stroke-linecap="round" stroke-linejoin="round"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path></svg>
      {/if}
    </button>

    <button class="btn-sign" onclick={() => changePage('sign-in')}>Sign in</button>
    <button class="btn-start" onclick={() => changePage('get-started')}>Get started <span class="arr">→</span></button>
  </div>
</nav>
