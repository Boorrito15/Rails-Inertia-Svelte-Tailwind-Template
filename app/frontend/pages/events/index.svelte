<script>
  export let events
</script>

<h1>All Events</h1>

{#each events as event}
  <div>
    <a href="/event/{event.id}">{event.title}</a>
  </div>
{/each}
