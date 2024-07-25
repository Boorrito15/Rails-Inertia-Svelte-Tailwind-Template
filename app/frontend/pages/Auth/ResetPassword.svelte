<svelte:head>
  <title>Reset Password</title>
</svelte:head>

<script lang="ts">
  import { useForm } from '@inertiajs/svelte';
  import { Button } from "$lib/components/ui/button/index.js";
  import { Input } from "$lib/components/ui/input/index.js";
  import { Label } from "$lib/components/ui/label/index.js";

  let form = useForm({
    user: {
      password: null,
      password_confirmation: null,
      reset_password_token: ''
    }
  });

  function submit() {
    form.put('/password', {
      reset_password_token: $form.user.reset_password_token
    });
  }
</script>

<div class="w-full max-w-sm mx-auto mt-10">
  <form on:submit|preventDefault={submit}>
    <h1 class="text-2xl">Reset Password</h1>
    <p>Enter your new password.</p>
    <div class="grid gap-4">
      <div class="grid gap-2">
        <Label for="password">New Password</Label>
        <Input id="password" type="password" bind:value={$form.user.password} placeholder="New Password" required />
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
    </div>
    <Button type="submit" disabled={$form.processing}>Reset Password</Button>
  </form>
</div>
