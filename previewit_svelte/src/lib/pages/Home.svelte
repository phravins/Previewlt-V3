<script lang="ts">
  import Hero from '../components/Hero.svelte';
  import LogosStrip from '../components/LogosStrip.svelte';
  import HowItWorks from '../components/HowItWorks.svelte';
  import Features from '../components/Features.svelte';
  import Stats from '../components/Stats.svelte';
  import Testimonials from '../components/Testimonials.svelte';
  import Cta from '../components/Cta.svelte';

  interface Props {
    showToast: (msg: string) => void;
  }
  let { showToast }: Props = $props();
</script>

<div class="page page-home active">
  <Hero />
  <LogosStrip />
  <HowItWorks />
  <Features {showToast} />
  <Stats />
  <Testimonials />
  <Cta />
</div>
