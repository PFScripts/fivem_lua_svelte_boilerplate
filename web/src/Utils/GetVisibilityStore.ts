import {writable, type Writable} from 'svelte/store';

export interface VisibilityStore {visibility: Writable<boolean>, setVisibility: (visible: boolean) => void, component: string};

const CreateVisibilityStore = (component: string): VisibilityStore => {
  const visibility = writable(false);
  const setVisibility = (value: boolean) => {
    visibility.set(value);
  };
  return {visibility, setVisibility, component};
};

export const GetVisibilityStore = (component: string): VisibilityStore => CreateVisibilityStore(component);