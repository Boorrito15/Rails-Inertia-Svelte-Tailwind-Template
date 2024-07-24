// app / frontend / entrypoints / application.js;
import "../stylesheets/main.css";
import Layout from "../layouts/Layout.svelte";
import { createInertiaApp } from "@inertiajs/svelte";
import { userStore } from "../stores/userStore";

const pages = import.meta.glob("../pages/**/*.svelte", { eager: true });

createInertiaApp({
  resolve: (name) => {
    const page = pages[`../pages/${name}.svelte`];
    return { default: page.default, layout: page.layout || Layout };
  },
  setup({ el, App, props }) {
    if (props.initialPage.props.auth && props.initialPage.props.auth.user) {
      userStore.set(props.initialPage.props.auth.user);
    } else {
      userStore.set(null);
    }

    new App({ target: el, props });
  },
});
