<svelte:head>
  <title>Forgot Password</title>
</svelte:head>

<script lang="ts">
  import { useForm } from '@inertiajs/svelte';
  import { Button } from "$lib/components/ui/button/index.js";
  import { Input } from "$lib/components/ui/input/index.js";
  import { Label } from "$lib/components/ui/label/index.js";

  let form = useForm({
    user: {
      email: null,
    }
  });

  function submit() {
    form.post('/password/email');
  }
</script>

<div class="w-full max-w-sm mx-auto mt-10">
  <form on:submit|preventDefault={submit}>
    <h1 class="text-2xl">Forgot Password</h1>
    <p>Enter your email address to reset your password.</p>
    <div class="grid gap-4">
      <div class="grid gap-2">
        <Label for="email">Email</Label>
        <Input id="email" type="email" bind:value={$form.user.email} placeholder="Email" required />
        {#if $form.errors.user?.email}
          <div class="form-error">{$form.errors.user.email}</div>
        {/if}
      </div>
    </div>
    <Button type="submit" disabled={$form.processing}>Send Password Reset Link</Button>
  </form>
</div>
