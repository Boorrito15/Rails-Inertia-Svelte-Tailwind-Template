<script lang="ts">
  import dayjs from 'dayjs'

  export let event

  let formattedStartDate = event.start_date
    ? dayjs(event.start_date).format('D MMMM YYYY, hh:mm A')
    : ''
</script>

<h1 class="mb-6 text-3xl font-bold">{event.title}</h1>
<p>{event.description}</p>

<p>{formattedStartDate}</p>
