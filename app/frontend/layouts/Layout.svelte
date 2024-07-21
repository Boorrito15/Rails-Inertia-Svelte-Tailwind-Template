<script lang="ts">
  import { onMount } from 'svelte';
  import { ModeWatcher } from "mode-watcher";
  import { Button } from "$lib/components/ui/button";
  import Sun from "svelte-radix/Sun.svelte";
  import Moon from "svelte-radix/Moon.svelte";
  import { toggleMode } from 'mode-watcher';
  import MainNav from "../components/Layouts/MainNav.svelte";

  //   // Force light mode on initial load
  // onMount(() => {
  //   document.documentElement.classList.remove('dark');
  //   localStorage.setItem('theme', 'light'); // Ensure the theme is saved in local storage
  // });
</script>

<ModeWatcher defaultMode="light" />

<div class="p-12">
  <Button on:click={toggleMode} variant="outline" size="icon">
    <Sun
      class="h-[1.2rem] w-[1.2rem] rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0"
    />
    <Moon
      class="absolute h-[1.2rem] w-[1.2rem] rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100"
    />
    <span class="sr-only">Toggle theme</span>
  </Button>
</div>

<div>
  <MainNav />
  <main>
    <div class="px-4 mx-auto max-w-7xl sm:px-8">
      <slot />
    </div>
  </main>
</div>
