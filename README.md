<h1 align='center'>
  FiveM Lua & Svelte Boilerplate
</h1>

<div align="center">
  This boilerplate provides a modern Svelte setup specifically designed for being compatible with the CfxLua runtime.
</div>

<div align='center'>

  ![GitHub License](https://img.shields.io/github/license/PFScripts/fivem_lua_svelte_boilerplate?label=License&labelColor=%E2%80%8E%E2%80%8E&color=%2330b893)
  <a href='https://discord.gg/QhMmyx8xsE'>
    ![Discord](https://img.shields.io/discord/1279910494425186446?style=flat&logo=discord&logoColor=%2330b893&label=%E2%80%8E%20&labelColor=%E2%80%8E%E2%80%8E&color=%2330b893)
  </a>
</div>

## `Information`

* **Fast Build System:** Powered by Vite for quick and efficient development.
* **Flexible Workflows:** Supports both browser and in-game development, making it versatile for various scenarios.
* **CfxLua Runtime Compatibility:** Seamlessly integrates with the CfxLua runtime for FiveM applications.

## `Requirements`

- [**ox_lib**](https://github.com/overextended/ox_lib/releases/latest)
- [**Node > v22.11.0**](https://nodejs.org/en/)
- [**PNPM (Preferred but not required)**](https://pnpm.io/)

## `Getting Started`

### `Installation`

The boilerplate was built `pnpm` but is still compatible with `npm`.

1. Clone the repository or use the template option and place it within your `resources` folder.
2. Go to the `web` folder within a terminal of your choice and type `pnpm i` or `npm i`.

## `Features`

### `Web | Scripts`

* (`pnpm` or `npm`) `run dev` – Starts the development server.
* (`pnpm` or `npm`) `run build` – Builds the project.
* (`pnpm` or `npm`) `run build:watch` – Builds the project and watches for changes.
* (`pnpm` or `npm`) `run check` – Runs type checking and validation for the project.


### `Web | LocaleProvider`

```svelte
<!-- `LocaleProvider` retrieves the locale from the Lua side using `ox_lib` locales. If you're in the browser, it will return an empty string, so ensure you set a default value for your text. -->
<!-- Example: -->
<script lang='ts'>
  import { Locale } from '../Utils/LocaleProvider';
  let counterText = 'Counter:';
  let incrementText = 'Increment';
  let decrementText = 'Decrement';
  const loadLocales = async () => {
    counterText = await Locale('counter');
    incrementText = await Locale('increment');
    decrementText = await Locale('decrement');
  };
  loadLocales();
</script>

<main>
  <span>{counterText}</span>
  <span>{incrementText}</span>
  <span>{decrementText}</span>
</main>
```

### `Web | VisibilityProvider`

```svelte
<!-- `VisibilityProvider` is a component that manages the visibility state of its children. -->
<!-- To enable toggling the visibility of its children, you must specify a `component` name as a string. -->
<!-- You can then toggle visibility using the specified name, either from the client or with `SendNuiMessage`. -->
<!-- Use `SendNuiMessage` with the format: `'setVisible<NameOfYourComponent>'`. -->
<!-- Example: -->
<VisibilityProvider component='Counter'>
  <Counter />
</VisibilityProvider>
```

### `Web | TriggerNuiCallback`

```ts
// Triggers a callback registered with the REGISTER_NUI_CALLBACK native.
// Example:
TriggerNuiCallback<unknown>('setPlayerInfo', playerInfo).then(data => {
  // Whatever logic you want here
});
```

### `Web | HandleNuiMessage`

```ts
// `HandleNuiMessage` is a hook that listens for events sent from the client and invokes a handler when an event with the specified action is received.
// Example:
HandleNuiMessage<unknown>('getPlayerInfo').then(data => {
  // Whatever logic you want here
});
```

### `Web | SendNuiMessage`

```ts
// Example:
// This stimulates the SEND_NUI_MESSAGE native in the development environment.
// Expects an array as the 1st arg and the 2nd args its the delay in ms.
SendNuiMessage([
  {action: 'setVisibleCounter', data: true}
], 0);
```

### `Lua | handleNui`

```lua
-- The data type is located on the types.lua
-- Example:
  local data = {message = {action = 'setVisibleCounter', data = true}, focus = true}
  handleNui(data)
```