import {onDestroy} from 'svelte';

interface Message<T = unknown> {action: string, data: T};

type MessageHandler<T = unknown> = (data: T) => void;

const messageListeners = new Map<string, MessageHandler[]>();

const messageListener = (message: MessageEvent<Message>) => {
  const {action, data} = message.data;
  const handlers = messageListeners.get(action);
  if (handlers) {
    for (const handler of handlers) {
      handler(data);
    };
  };
};

window.addEventListener('message', messageListener);

export function HandleNuiMessage<T = unknown>(action: string, handler: MessageHandler<T>) {
  const handlers = messageListeners.get(action) || [];
  handlers.push(handler as MessageHandler);
  messageListeners.set(action, handlers);
  onDestroy(() => {
    const handlers = messageListeners.get(action) || [];
    messageListeners.set(action, handlers.filter((handlerToRemove) => handlerToRemove !== handler));
  });
};