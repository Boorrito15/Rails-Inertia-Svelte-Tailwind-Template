<script lang="ts">
  export let events
  import { Button } from "$lib/components/ui/button";
  import * as Accordion from "$lib/components/ui/accordion/index.js";
  import * as Card from "$lib/components/ui/card";
  import Bell from "svelte-radix/Bell.svelte";
  import Check from "svelte-radix/Check.svelte";
  import { Switch } from "$lib/components/ui/switch/index.js";

  const notifications = [
  {
    title: "Your call has been confirmed.",
    description: "1 hour ago"
  },
  {
    title: "You have a new message!",
    description: "1 hour ago"
  },
  {
    title: "Your subscription is expiring soon!",
    description: "2 hours ago"
  }
];
</script>

<h1 class="text-3xl font-bold underline">Hello World!</h1>
<p class="font-thin text-gray-700">This is the App component</p>

<h1>All Events</h1>

{#each events as event}
  <div>
    <a href="/event/{event.id}">{event.title}</a>
  </div>
{/each}

<Button>Click me</Button>

<Accordion.Root class="w-full sm:max-w-[70%]">
  <Accordion.Item value="item-1">
    <Accordion.Trigger>Is it accessible?</Accordion.Trigger>
    <Accordion.Content
      >Yes. It adheres to the WAI-ARIA design pattern.</Accordion.Content
    >
  </Accordion.Item>
  <Accordion.Item value="item-2">
    <Accordion.Trigger>Is it styled?</Accordion.Trigger>
    <Accordion.Content>
      Yes. It comes with default styles that matches the other components'
      aesthetic.
    </Accordion.Content>
  </Accordion.Item>
  <Accordion.Item value="item-3">
    <Accordion.Trigger>Is it animated?</Accordion.Trigger>
    <Accordion.Content>
      Yes. It's animated by default, but you can disable it if you prefer.
    </Accordion.Content>
  </Accordion.Item>
</Accordion.Root>

<Card.Root>
  <Card.Header>
    <Card.Title>Card Title</Card.Title>
    <Card.Description>Card Description</Card.Description>
  </Card.Header>
  <Card.Content>
    <p>Card Content</p>
  </Card.Content>
  <Card.Footer>
    <p>Card Footer</p>
  </Card.Footer>
</Card.Root>

<Card.Root class="w-[380px]">
<Card.Header>
  <Card.Title>Notifications</Card.Title>
  <Card.Description>You have 3 unread messages.</Card.Description>
</Card.Header>
<Card.Content class="grid gap-4">
  <div class="flex items-center p-4 space-x-4 border rounded-md">
    <Bell />
    <div class="flex-1 space-y-1">
      <p class="text-sm font-medium leading-none">Push Notifications</p>
      <p class="text-sm text-muted-foreground">
        Send notifications to device.
      </p>
    </div>
    <Switch />
  </div>
  <div>
    {#each notifications as notification, idx (idx)}
      <div
        class="mb-4 grid grid-cols-[25px_1fr] items-start pb-4 last:mb-0 last:pb-0"
      >
        <span class="flex w-2 h-2 translate-y-1 rounded-full bg-sky-500" />
        <div class="space-y-1">
          <p class="text-sm font-medium leading-none">
            {notification.title}
          </p>
          <p class="text-sm text-muted-foreground">
            {notification.description}
          </p>
        </div>
      </div>
    {/each}
  </div>
</Card.Content>
<Card.Footer>
  <Button class="w-full">
    <Check class="w-4 h-4 mr-2" /> Mark all as read
  </Button>
</Card.Footer>
</Card.Root>
