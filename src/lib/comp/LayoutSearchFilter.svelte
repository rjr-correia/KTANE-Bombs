<script lang="ts">
	import { browser } from '$app/environment';
	import Input from '$lib/controls/Input.svelte';
	import TextArea from '$lib/controls/TextArea.svelte';
	import { createEventDispatcher, onMount } from 'svelte';

	export let id: string;
	export let label: string = 'Find:';
	export let items: { [name: string]: any };
	export let filterFunc: (itemKey: string, text: string) => boolean;
	export let searchText: string = '';
	export let rawSearchText: string = '';
	export let title: string = '';
	export let textArea: boolean = false;
	export let rows: number = 2;
	export let classes: string = '';
	export let autoExpand: boolean = false;
	export let numResults: number = 0;
	export let showNoneForBlank: boolean = false;
	export let searching: boolean = false;
	export let showAll: boolean = true;
	export let resultLimit: number = 50;

	const dispatch = createEventDispatcher();
	let searchField: HTMLInputElement | null;

	function clearSearch() {
		rawSearchText = '';
		updateSearch();
		dispatch('change');
		searchField?.focus();
	}

	export const updateSearch = () => {
		searching = false;
		searchText = rawSearchText.replace(/[\r\n]/g, ' ').trim();
		updateSearchFilter();
	};

	function updateSearchFilter() {
		numResults = 0;
		searching = true;
		Object.keys(items).forEach(item => {
			if (showNoneForBlank && searchText.length == 0) items[item]?.classList.add('search-filtered-out');
			else if (filterFunc(item, searchText)) {
				if (showAll || numResults < resultLimit) items[item]?.classList.remove('search-filtered-out');
				else items[item]?.classList.add('search-filtered-out');
				numResults++;
			} else items[item]?.classList.add('search-filtered-out');
		});
		searching = false;
		dispatch('input');
	}

	if (browser) searchField = <HTMLInputElement>document.getElementById(id);
</script>

<div class="flex">
	{#if textArea}
		<TextArea
			{label}
			{id}
			{title}
			labelClass="help"
			sideLabel
			classes="search-field help {classes}"
			on:input={updateSearch}
			on:change
			{autoExpand}
			{rows}
			bind:value={rawSearchText} />
	{:else}
		<Input
			{label}
			{id}
			{title}
			labelClass="help"
			sideLabel
			classes="search-field help {classes}"
			on:input={updateSearch}
			on:change
			bind:value={rawSearchText} />
	{/if}
	<div class="search-field-clear dark-invert" on:click={clearSearch} />
</div>

<style>
	:global(.search-field) {
		min-width: 65px;
	}
	:global(.search-filtered-out) {
		display: none !important;
	}
	.flex {
		align-items: center;
	}

	.search-field-clear {
		background: url('$lib/img/clear-button.svg') right center no-repeat;
		width: 1.25em;
		height: 1.25em;
		min-width: 1.25em;
		display: inline-block;
		vertical-align: middle;
		cursor: pointer;
	}
</style>
