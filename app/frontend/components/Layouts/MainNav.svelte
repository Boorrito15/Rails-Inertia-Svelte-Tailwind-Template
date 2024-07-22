<!-- frontend/components/Layouts/MainNav.svelte -->

<script>
  import { Link, page, inertia } from '@inertiajs/svelte'
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
      <button use:inertia="{{ href: '/logout', method: 'delete' }}"
              type="button">
        Sign out
      </button>
    {:else}
      <Link href="/login">Sign in</Link>
      <Link href="/sign_up">Sign up</Link>
    {/if}
  </div>
</nav>
