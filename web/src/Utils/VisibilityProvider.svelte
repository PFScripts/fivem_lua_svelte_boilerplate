<script lang='ts'>
  import {onMount, onDestroy, setContext} from 'svelte';
  import {GetVisibilityStore} from './GetVisibilityStore';
  import {HandleNuiMessage } from './HandleNuiMessage';
  import {TriggerNuiCallback} from './TriggerNuiCallback';
  export let component: string;
  const {visibility, setVisibility} = GetVisibilityStore(component);
  let isVisible = false;
  setContext(`${component}`, { setVisibility });
  const unsubscribe = visibility.subscribe((visible) => {
    isVisible = visible;
  });
  HandleNuiMessage(`setVisible${component}`, (visible: boolean) => {
    setVisibility(visible);
  });
  onMount(() => {
    const keyHandler = (e: KeyboardEvent) => {
      if (isVisible && (['Escape'].includes(e.code) || ['Backspace'].includes(e.code))) {
        TriggerNuiCallback('hideUI');
        setVisibility(false);
      };
    };
    window.addEventListener('keydown', keyHandler);
    onDestroy(() => {
      window.removeEventListener('keydown', keyHandler);
      unsubscribe();
    });
  });
</script>

<main>
  {#if isVisible}
    <slot />
  {/if}
</main>