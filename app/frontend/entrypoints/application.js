import { createInertiaApp } from "@inertiajs/svelte";
import "../stylesheets/main.css";
import Layout from "../layouts/Layout.svelte";

// Use import.meta.glob to dynamically import Svelte components
const pages = import.meta.glob("../pages/**/*.svelte");

createInertiaApp({
  resolve: async (name) => {
    // Ensure the path matches the actual case and file structure
    const path = `../pages/${name}.svelte`.toLowerCase();
    console.log("Attempting to load component from:", path);

    const pageModule = pages[path];

    if (!pageModule) {
      console.error(`Component not found for path: ${path}`);
      throw new Error(`Component not found: ${path}`);
    }

    // Dynamically import the component
    const page = await pageModule(); // pageModule should be a function
    return { default: page.default, layout: page.layout || Layout };
  },
  setup({ el, App, props }) {
    new App({ target: el, props });
  },
});
