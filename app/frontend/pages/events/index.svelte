<script lang="ts">
  import New from './new.svelte'
  import { Link } from '@inertiajs/svelte';

  let show = false

  function toggleShow() {
    show = !show
  }

  export let events;

  // Reactively update `updatedEvents` when `events` changes
  $: updatedEvents = events;

</script>

<h1 class="mb-6 text-2xl font-bold">All events</h1>

<Link href="/events/new">New event (New Page)</Link>

<button on:click={ toggleShow } >New Event (In line)</button>

{#if show}
  <New/>
{/if}

<div class="mt-6 space-y-6">
  {#each updatedEvents as event (event.id)}
    <div>
      <Link href={`/events/${event.id}`}>{event.title}</Link>
      <Link href={`/events/${event.id}/edit`}>Edit</Link>
      <p>{event.id}</p>
      <Link
        href={`/events/${event.id}`}
        method="delete"
        as="button"
        type="button"
        class="text-indigo-600 hover:text-indigo-900"
      >
        Delete
      </Link>
    </div>
  {/each}
</div>
