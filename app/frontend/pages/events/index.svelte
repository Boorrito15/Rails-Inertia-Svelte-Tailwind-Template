<script>
  import { inertia, Link } from '@inertiajs/svelte'

  export let events
</script>

<h1 class="mb-6 text-2xl font-bold">All events</h1>

<Link href="/events/new">New event</Link>

<div class="mt-6">
  {#each events as event}
    <div>
      <Link href="/events/{event.id}">{event.title}</Link>
      <Link href="/events/{event.id}/edit">Edit</Link>
      <button use:inertia="{{ href: '/events/'+event.id, method: 'delete' }}" type="button" class="text-indigo-600 hover:text-indigo-900">Delete</button>
    </div>
  {/each}
</div>
