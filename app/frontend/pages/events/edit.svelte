<script>
  import { useForm } from '@inertiajs/svelte'

  export let event

  let form = useForm({
    title: event.title,
    description: event.description,
    start_date: event.start_date // This should be in the 'YYYY-MM-DDTHH:MM' format
  })

  function submit() {
    $form.put(`/events/${event.id}`)
  }
</script>

<form on:submit|preventDefault={submit}>
  <div>
    <label for="title">Title</label>
    <input type="text" bind:value={$form.title} />
    {#if $form.errors.title}
      <div class="form-error">{$form.errors.title}</div>
    {/if}
  </div>

  <div>
    <label for="description">Description</label>
    <input type="text" bind:value={$form.description} />
    {#if $form.errors.description}
      <div class="form-error">{$form.errors.description}</div>
    {/if}
  </div>

  <div>
    <label for="start_date">Start Date</label>
    <input type="datetime-local" bind:value={$form.start_date} />
    {#if $form.errors.start_date}
      <div class="form-error">{$form.errors.start_date}</div>
    {/if}
  </div>

  <button type="submit" disabled={$form.processing}>Submit</button>
</form>
