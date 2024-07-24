<script lang="ts">
  import dayjs from 'dayjs';
  import { useForm, router } from '@inertiajs/svelte';
  import { createEventDispatcher } from 'svelte';

  export let toggleEditForm
  export let event;

  const dispatch = createEventDispatcher();

  // Format the date for the datetime-local input
  let formattedStartDate = event.start_date
    ? dayjs(event.start_date).format('YYYY-MM-DDTHH:mm')
    : '';

  // Initialize the form with formatted date
  let form = useForm({
    title: event.title,
    description: event.description,
    start_date: formattedStartDate // Use formatted date
  });

  async function submit() {
    await $form.put(`/events/${event.id}`, {
      onSuccess: () => {
        $form.reset();
        router.visit('/events');
      }
    });
    dispatch('submitted');
  }

  function cancel() {
    $form.reset();
    if (toggleEditForm) {
      toggleEditForm();
    } else {
      router.visit('/events'); // Hide the form when cancel is clicked
    }
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
  <button type="button" on:click={cancel}>Cancel</button>
</form>
