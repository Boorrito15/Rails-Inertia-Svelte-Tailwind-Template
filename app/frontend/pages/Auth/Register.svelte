<svelte:head>
  <title>Sign Up</title>
</svelte:head>

<script lang="ts">
  import { useForm } from '@inertiajs/svelte';
  import { Button } from "$lib/components/ui/button/index.js";
  import * as Card from "$lib/components/ui/card/index.js";
  import { Input } from "$lib/components/ui/input/index.js";
  import { Label } from "$lib/components/ui/label/index.js";

  let form = useForm({
    user: {
      first_name: null,
      last_name: null,
      email: null,
      password: null,
      password_confirmation: null,
    }
  });

  function submit() {
    $form.post('/sign_up');
  }
</script>

<Card.Root class="w-full max-w-sm mx-auto mt-10">
  <form on:submit|preventDefault={submit}>
    <Card.Header>
      <Card.Title class="text-2xl">Sign Up</Card.Title>
      <Card.Description>Fill in the details below to create a new account.</Card.Description>
    </Card.Header>
    <Card.Content class="grid gap-4">
      <div class="grid gap-2">
        <Label for="first_name">First Name</Label>
        <Input id="first_name" type="text" bind:value={$form.user.first_name} placeholder="First Name" required />
        {#if $form.errors.user?.first_name}
          <div class="form-error">{$form.errors.user.first_name}</div>
        {/if}
      </div>
      <div class="grid gap-2">
        <Label for="last_name">Last Name</Label>
        <Input id="last_name" type="text" bind:value={$form.user.last_name} placeholder="Last Name" required />
        {#if $form.errors.user?.last_name}
          <div class="form-error">{$form.errors.user.last_name}</div>
        {/if}
      </div>
      <div class="grid gap-2">
        <Label for="email">Email</Label>
        <Input id="email" type="email" bind:value={$form.user.email} placeholder="Email" required />
        {#if $form.errors.user?.email}
          <div class="form-error">{$form.errors.user.email}</div>
        {/if}
      </div>
      <div class="grid gap-2">
        <Label for="password">Password</Label>
        <Input id="password" type="password" bind:value={$form.user.password} placeholder="Password" required />
        {#if $form.errors.user?.password}
          <div class="form-error">{$form.errors.user.password}</div>
        {/if}
      </div>
      <div class="grid gap-2">
        <Label for="password_confirmation">Confirm Password</Label>
        <Input id="password_confirmation" type="password" bind:value={$form.user.password_confirmation} placeholder="Confirm Password" required />
        {#if $form.errors.user?.password_confirmation}
          <div class="form-error">{$form.errors.user.password_confirmation}</div>
        {/if}
      </div>
    </Card.Content>
    <Card.Footer>
      <Button class="w-full" type="submit" disabled={$form.processing}>Sign Up</Button>
    </Card.Footer>
  </form>
</Card.Root>
