<script lang="ts">
  export let events
  import { Button } from "$lib/components/ui/button";
  import * as Accordion from "$lib/components/ui/accordion/index.js";

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
