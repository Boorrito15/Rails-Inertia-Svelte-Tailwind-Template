<script lang="ts">
  import { useForm } from '@inertiajs/svelte'

  let form = useForm({
    title: null,
    description: null,
    start_date: null
  })

  async function submit() {
    await $form.post('/events')
    $form.reset()
    console.log($form.title)
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
    <input id="start_date" type="datetime-local" bind:value={$form.start_date} />
    {#if $form.errors.start_date}
      <div class="form-error">{$form.errors.start_date}</div>
    {/if}
  </div>

  <button type="submit" disabled={$form.processing}>Submit</button>
</form>
