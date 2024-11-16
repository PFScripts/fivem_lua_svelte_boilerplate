<script lang='ts'>
  import { Locale } from '../Utils/LocaleProvider';
  let count = 0;
  const increment = () => { count += 1; };
  const decrement = () => { count -= 1; };
  let counterText = '';
  let incrementText = '';
  let decrementText = '';
  const loadLocales = async () => {
    counterText = await Locale('counter');
    incrementText = await Locale('increment');
    decrementText = await Locale('decrement');
  };
  loadLocales();
</script>

<div class='parent'>
  <div class='counter'>
    <h3>{counterText !== '' ? counterText : 'Counter:'} {count}</h3>
    <button on:click={increment}>{incrementText !== '' ? incrementText : 'Increment'}</button>
    <button on:click={decrement}>{decrementText !== '' ? decrementText : 'Decrement'}</button>
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
