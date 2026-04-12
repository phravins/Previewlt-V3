<script lang="ts">
  import { onMount } from 'svelte';
  import Navbar from './lib/components/Navbar.svelte';
  import Hero from './lib/components/Hero.svelte';
  import LogosStrip from './lib/components/LogosStrip.svelte';
  import HowItWorks from './lib/components/HowItWorks.svelte';
  import Features from './lib/components/Features.svelte';
  import Converter from './lib/components/Converter.svelte';
  import Stats from './lib/components/Stats.svelte';
  import Testimonials from './lib/components/Testimonials.svelte';
  import Cta from './lib/components/Cta.svelte';
  import Footer from './lib/components/Footer.svelte';
  import Toast from './lib/components/Toast.svelte';

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

  onMount(() => {
    // Reveal Observer for scroll animations
    const obs = new IntersectionObserver(es => {
      es.forEach(e => {
        if (e.isIntersecting) {
          e.target.classList.add('visible');
          obs.unobserve(e.target);
        }
      });
    }, { threshold: .1 });
    
    document.querySelectorAll('.reveal').forEach(el => obs.observe(el));
    
    // Initial delays for hero elements
    setTimeout(() => {
      document.querySelectorAll('.hero .reveal, .hero-social.reveal').forEach((el, i) => {
        setTimeout(() => el.classList.add('visible'), i * 100 + 80);
      });
    }, 80);
  });
</script>

<Navbar />
<Hero />
<LogosStrip />
<HowItWorks />
<Features {showToast} />
<Converter {showToast} />
<Stats />
<Testimonials />
<Cta />
<Footer />
<Toast message={toastMessage} show={showToastFlag} />
