<svelte:head>
  <title>Login</title>
</svelte:head>

<script lang="ts">
  import { useForm } from '@inertiajs/svelte';
  import { Button } from "$lib/components/ui/button/index.js";
  import * as Card from "$lib/components/ui/card/index.js";
  import { Input } from "$lib/components/ui/input/index.js";
  import { Label } from "$lib/components/ui/label/index.js";

  let form = useForm({
    user: {
      email: null,
      password: null,
      remember: false,
    }
  });

  function submit() {
    $form.post('/login');
  }
</script>

<Card.Root class="w-full max-w-sm mx-auto mt-10">
  <form on:submit|preventDefault={submit}>
    <Card.Header>
      <Card.Title class="text-2xl">Login</Card.Title>
      <Card.Description>Enter your email below to login to your account.</Card.Description>
    </Card.Header>
    <Card.Content class="grid gap-4">
      <div class="grid gap-2">
        <Label for="email">Email</Label>
        <Input id="email" type="email" bind:value={$form.user.email} placeholder="m@example.com" required />
        {#if $form.errors.user?.email}
          <div class="form-error">{$form.errors.user.email}</div>
        {/if}
      </div>
      <div class="grid gap-2">
        <Label for="password">Password</Label>
        <Input id="password" type="password" bind:value={$form.user.password} required />
        {#if $form.errors.user?.password}
          <div class="form-error">{$form.errors.user.password}</div>
        {/if}
      </div>
      <div class="flex items-center">
        <input id="remember" type="checkbox" bind:checked={$form.user.remember} class="mr-2" />
        <Label for="remember">Remember Me</Label>
      </div>
    </Card.Content>
    <Card.Footer>
      <Button class="w-full" type="submit" disabled={$form.processing}>Sign in</Button>
    </Card.Footer>
  </form>
</Card.Root>
