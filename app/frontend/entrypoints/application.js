import axios from "axios";
import { createInertiaApp } from "@inertiajs/svelte";
import "../stylesheets/main.css";
import Layout from "../layouts/Layout.svelte";

const pages = import.meta.glob("../pages/**/*.svelte");

const csrfToken = document.querySelector("meta[name=csrf-token]").content;
axios.defaults.headers.common["X-CSRF-Token"] = csrfToken;

createInertiaApp({
  resolve: async (name) => {
    const page = await pages[`../pages/${name}.svelte`]();
    return { default: page.default, layout: page.layout || Layout };
  },
  setup({ el, App, props }) {
    new App({ target: el, props });
  },
});
