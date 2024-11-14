import {IsRunningInBrowser} from './IsRunningInBrowser';

interface Message<T = unknown> { action: string, data: T };

/**
 * This simulates the `SEND_NUI_MESSAGE` native.
 *
 * `(This will only work and be used in a development environment)`
 *
 * @param messages Array of messages to send to the NUI.
 * @param delay The delay (in milliseconds) between each message being sent (default: 1000ms).
 */
export const SendNuiMessage = <T>(messages: Message<T>[], delay = 1000): void => {
  if (IsRunningInBrowser()) {
    for (const message of messages) {
      setTimeout(() => {
        window.dispatchEvent(new MessageEvent('message', {data: {action: message.action, data: message.data}}));
      }, delay);
    };
  };
};