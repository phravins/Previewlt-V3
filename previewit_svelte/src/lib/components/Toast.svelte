<script lang="ts">
  interface Props {
    message?: string;
    show?: boolean;
  }
  let { message = '', show = false }: Props = $props();
</script>

<div class="toast" style="opacity: {show ? 1 : 0}; transform: {show ? 'translateY(0)' : 'translateY(8px)'}">
  {message}
</div>

<style>
  .toast {
    position: fixed;
    bottom: 24px;
    right: 24px;
    background: var(--ink2);
    color: white;
    padding: 12px 20px;
    border-radius: var(--r-md);
    font-size: 13px;
    font-weight: 500;
    transition: all .3s;
    pointer-events: none;
    z-index: 999;
  }
</style>
