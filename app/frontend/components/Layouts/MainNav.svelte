<!-- frontend/components/Layouts/MainNav.svelte -->

<script>
  import { Link, page, inertia } from '@inertiajs/svelte'
  import * as DropdownMenu from "$lib/components/ui/dropdown-menu";
  import { Button } from "$lib/components/ui/button";
  import { userStore } from "../../stores/userStore";
</script>

<nav class="flex justify-between p-6 mx-auto max-w-7xl">
  <ul class="flex items-center space-x-8">
    <li>
      <Link href="/">Home</Link>
    </li>
    <li>
      <Link href="/events">Events</Link>
    </li>
  </ul>

  <div>
    {#if $page.props.auth}
      <div>Welcome, {$userStore.email}!</div>

      <DropdownMenu.Root>
        <DropdownMenu.Trigger asChild let:builder>
          <Button
            variant="outline"
            size="icon"
            class="overflow-hidden rounded-full"
            builders={[builder]}
          >
            <img
              src="https://github.com/shadcn.png"
              width={36}
              height={36}
              alt="Avatar"
              class="overflow-hidden rounded-full"
            />
          </Button>
        </DropdownMenu.Trigger>
        <DropdownMenu.Content align="end">
          <DropdownMenu.Label>My Account</DropdownMenu.Label>
          <DropdownMenu.Separator />
          <DropdownMenu.Item>Settings</DropdownMenu.Item>
          <DropdownMenu.Item>Support</DropdownMenu.Item>
          <DropdownMenu.Separator />
          <DropdownMenu.Item>
            <button use:inertia="{{ href: '/logout', method: 'delete' }}" type="button" class="w-full text-left">
              Sign out
            </button>
          </DropdownMenu.Item>
        </DropdownMenu.Content>
      </DropdownMenu.Root>


    {:else}
      <Link href="/login">Sign in</Link>
      <Link href="/sign_up">Sign up</Link>
    {/if}
  </div>
</nav>
