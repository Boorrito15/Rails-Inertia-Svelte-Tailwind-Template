<script lang="ts">
  import New from './new.svelte';
  import Edit from './edit.svelte';
  import { Link } from '@inertiajs/svelte';

  let showNewForm = false;
  let editingEventId = null; // Stores the ID of the event being edited

  function toggleNewForm() {
    showNewForm = !showNewForm;
  }

  function toggleEditForm(id = null) {
    editingEventId = editingEventId === id ? null : id;
  }

  export let events;

  // Reactively update `updatedEvents` when `events` changes
  $: updatedEvents = events;
</script>

<h1 class="mb-6 text-2xl font-bold">All events</h1>

<Link href="/events/new">New event (New Page)</Link>

<button on:click={toggleNewForm}>New Event (In line)</button>

{#if showNewForm}
  <New/>
{/if}

<div class="mt-6 space-y-6">
  {#each updatedEvents as event (event.id)}
    <div>
      {#if editingEventId === event.id}
        <Edit event={event} on:submitted={() => toggleEditForm(null)} />
      {:else}
        <Link href={`/events/${event.id}`}>{event.title}</Link>
        <Link href={`/events/${event.id}/edit`}>Edit (New Page)</Link>
        <p>{event.id}</p>
        <button on:click={() => toggleEditForm(event.id)}>Edit (In line)</button>
        <Link
          href={`/events/${event.id}`}
          method="delete"
          as="button"
          type="button"
          class="text-indigo-600 hover:text-indigo-900"
        >
          Delete
        </Link>
      {/if}
    </div>
  {/each}
</div>
