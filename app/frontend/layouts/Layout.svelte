<script lang="ts">
  import { onMount } from 'svelte';
  import { ModeWatcher } from "mode-watcher";
  import MainNav from "../components/Layouts/MainNav.svelte";

  //   // Force light mode on initial load
  // onMount(() => {
  //   document.documentElement.classList.remove('dark');
  //   localStorage.setItem('theme', 'light'); // Ensure the theme is saved in local storage
  // });
</script>

<ModeWatcher defaultMode="light" />

<div>
  <MainNav />
  <main>
    <div class="px-4 mx-auto max-w-7xl sm:px-8">
      <slot />
    </div>
  </main>
</div>
