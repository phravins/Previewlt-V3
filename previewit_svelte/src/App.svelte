<script lang="ts">
  import { onMount, setContext } from 'svelte';
  import Navbar from './lib/components/Navbar.svelte';
  import Home from './lib/pages/Home.svelte';
  import GetStarted from './lib/pages/GetStarted.svelte';
  import Docs from './lib/pages/Docs.svelte';
  import Changelog from './lib/pages/Changelog.svelte';
  import Privacy from './lib/pages/Privacy.svelte';
  import SignIn from './lib/pages/SignIn.svelte';
  import Footer from './lib/components/Footer.svelte';
  import Toast from './lib/components/Toast.svelte';

  let activePage = $state('home');
  let toastMessage = $state("");
  let showToastFlag = $state(false);
  let toastTimer: ReturnType<typeof setTimeout>;

  function showToast(msg: string) {
    toastMessage = msg;
    showToastFlag = true;
    clearTimeout(toastTimer);
    toastTimer = setTimeout(() => {
      showToastFlag = false;
    }, 2400);
  }

  // Provide changePage function globally
  setContext('changePage', (page: string) => {
    activePage = page;
    window.scrollTo({ top: 0, behavior: 'smooth' });
    if (page === 'home') setTimeout(initReveal, 100);
  });

  function initReveal() {
    const obs = new IntersectionObserver(es => {
      es.forEach(e => {
        if (e.isIntersecting) {
          e.target.classList.add('visible');
          obs.unobserve(e.target);
        }
      });
    }, { threshold: .1 });
    
    document.querySelectorAll('.reveal:not(.visible)').forEach(el => obs.observe(el));
    
    // Initial delays for hero elements
    setTimeout(() => {
      document.querySelectorAll('.hero .reveal, .hero-social.reveal').forEach((el, i) => {
        setTimeout(() => el.classList.add('visible'), i * 100 + 80);
      });
    }, 80);
  }

  onMount(() => {
    initReveal();
  });
</script>

<Navbar {activePage} />

<main id="app">
  {#if activePage === 'home'}
    <Home {showToast} />
  {:else if activePage === 'get-started'}
    <GetStarted {showToast} />
  {:else if activePage === 'docs'}
    <Docs />
  {:else if activePage === 'changelog'}
    <Changelog />
  {:else if activePage === 'privacy'}
    <Privacy />
  {:else if activePage === 'sign-in'}
    <SignIn />
  {/if}
</main>

<Footer />
<Toast message={toastMessage} show={showToastFlag} />

