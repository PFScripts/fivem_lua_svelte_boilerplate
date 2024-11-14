<script lang='ts'>
  import VisibilityProvider from './Utils/VisibilityProvider.svelte';
  import Counter from './Components/Counter.svelte';
  import {SendNuiMessage} from './Utils/SendNuiMessage';
  SendNuiMessage([{action: 'setVisibleCounter', data: true}], 0);
</script>

<main>
  <VisibilityProvider component='Counter'>
    <Counter />
  </VisibilityProvider>
</main>