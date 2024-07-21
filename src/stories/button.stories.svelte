<script context="module">
  import Button from '../lib/components/ui/button/button.svelte';

  export const meta = {
    title: "Example/Button",
    component: Button,
  };
</script>

<script>
  import { Story, Template } from '@storybook/addon-svelte-csf';

  let count = 0;
  function handleClick() {
    count += 1;
  }
</script>

<Template let:args>
  <Button {...args} on:click={handleClick}>
    You clicked: {count}
  </Button>
</Template>

<Story name="Default" args={{ variant: 'default', size: 'default' }} />

<Story name="Destructive" args={{ variant: 'destructive', size: 'default' }} />

<Story name="Outline" args={{ variant: 'outline', size: 'default' }} />

<Story name="Secondary" args={{ variant: 'secondary', size: 'default' }} />

<Story name="Ghost" args={{ variant: 'ghost', size: 'default' }} />

<Story name="Link" args={{ variant: 'link', size: 'default' }} />

<Story name="Small" args={{ variant: 'default', size: 'sm' }} />

<Story name="Large" args={{ variant: 'default', size: 'lg' }} />

<Story name="Icon" args={{ variant: 'default', size: 'icon' }}>
  <Button>
    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" viewBox="0 0 20 20" fill="currentColor">
      <path fill-rule="evenodd" d="M10 5a1 1 0 01.707.293l5 5a1 1 0 01-1.414 1.414L10 7.414l-4.293 4.293a1 1 0 01-1.414-1.414l5-5A1 1 0 0110 5z" clip-rule="evenodd" />
    </svg>
  </Button>
</Story>
