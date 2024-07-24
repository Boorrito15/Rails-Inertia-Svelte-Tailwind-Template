<script lang="ts">
  import dayjs from 'dayjs'
  import { Link } from '@inertiajs/svelte';

  export let event

  let formattedStartDate = event.start_date
    ? dayjs(event.start_date).format('D MMMM YYYY, hh:mm A')
    : ''
</script>

<h1 class="mb-6 text-3xl font-bold">{event.title}</h1>
<p>{event.description}</p>

<p>{formattedStartDate}</p>

<Link href={`/events/${event.id}/edit`}>Edit (New Page)</Link>

<Link
  href={`/events/${event.id}`}
  method="delete"
  as="button"
  type="button"
  class="text-indigo-600 hover:text-indigo-900"
  >
  Delete
</Link>
