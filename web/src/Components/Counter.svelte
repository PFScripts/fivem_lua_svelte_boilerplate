<script lang='ts'>
  import {getContext} from 'svelte';
  import type {VisibilityStore} from '../Utils/GetVisibilityStore';
  const {setVisibility} = getContext<VisibilityStore>('Counter');
  let count = 0;
  const increment = () => {count += 1};
  const decrement = () => {count -= 1};
  const hideCounter = () => {setVisibility(false)};
</script>

<div class='parent'>
  <div class='counter'>
    <h3>Counter: {count}</h3>
    <button on:click={increment}>Increment</button>
    <button on:click={decrement}>Decrement</button>
    <button on:click={hideCounter}>Hide Counter</button>
  </div>
</div>

<style>
  .parent {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }
  .counter {
    color: white;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 1rem;
    background-color: #2d2c3a;
    border: 1px solid #000000;
    border-radius: 8px;
    width: 200px;
  }
  button {
    margin: 0.5rem;
  }
</style>