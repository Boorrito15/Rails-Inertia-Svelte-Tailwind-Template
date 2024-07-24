<script lang="ts">
  import New from './new.svelte'; // Import the NewEventForm component
  import Edit from './edit.svelte'; // Import the EditEventForm component
  import { Link } from '@inertiajs/svelte';

  let showNewForm = false; // State to toggle new form visibility
  let editingEventId = null; // State to keep track of which event is being edited

  function toggleNewForm() {
    showNewForm = !showNewForm;
  }

  function toggleEditForm(id = null) {
    editingEventId = editingEventId === id ? null : id;
  }

  export let events; // List of events passed as props

  // Reactively update `updatedEvents` when `events` changes
  $: updatedEvents = events;
</script>

<h1 class="mb-6 text-2xl font-bold">All events</h1>

<Link href="/events/new">New event (New Page)</Link>
<button on:click={toggleNewForm}>New Event (In line)</button>

{#if showNewForm}
  <New {toggleNewForm}/>
{/if}

<div class="mt-6 space-y-6">
  {#each updatedEvents as event (event.id)}
    <div>
      {#if editingEventId === event.id}
      <Edit {event} toggleEditForm={toggleEditForm} on:submitted={() => toggleEditForm(null)} />
      {:else}
        <Link href={`/events/${event.id}`}>{event.title}</Link>
        <Link href={`/events/${event.id}/edit`}>Edit (New Page)</Link>
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
