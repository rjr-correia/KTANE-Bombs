import { writable } from 'svelte/store';

export const TP_TEAM = 'Twitch Plays';
export const UNKNOWN_ITEM = '[[Unknown]]';

export const currentSeason = writable(1);