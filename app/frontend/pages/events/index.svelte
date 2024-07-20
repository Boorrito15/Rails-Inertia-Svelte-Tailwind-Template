<script>
  export let events
  import { Button } from "$lib/components/ui/button";

</script>

<h1 class="text-3xl font-bold underline">Hello World!</h1>
<p class="font-thin text-gray-700">This is the App component</p>

<h1>All Events</h1>

{#each events as event}
  <div>
    <a href="/event/{event.id}">{event.title}</a>
  </div>
{/each}

<Button>Click me</Button>
