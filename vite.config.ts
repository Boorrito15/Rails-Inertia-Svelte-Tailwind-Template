import path from "path";
import { defineConfig } from "vite";
import RubyPlugin from "vite-plugin-ruby";
import { svelte } from "@sveltejs/vite-plugin-svelte";

export default defineConfig({
  resolve: {
    dedupe: ["axios"],
    alias: {
      $lib: path.resolve("./src/lib"),
      "svelte-radix": path.resolve(__dirname, "node_modules/svelte-radix/dist"),
    },
  },
  plugins: [RubyPlugin(), svelte()],
  optimizeDeps: {
    include: ["svelte-radix"],
  },
});
