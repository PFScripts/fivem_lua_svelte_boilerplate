import {IsRunningInBrowser} from './IsRunningInBrowser';
import {TriggerNuiCallback} from './TriggerNuiCallback';

export const Locale = async (key: string): Promise<string> => {
  if (IsRunningInBrowser()) return '';
  return await TriggerNuiCallback<string>('getLocale', key);
};