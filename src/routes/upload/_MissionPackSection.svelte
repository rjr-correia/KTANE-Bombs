<script lang="ts">
	import Input from '$lib/controls/Input.svelte';
	import type { MissionPack } from '$lib/types';
	import { getSteamID, validateSteamID } from '$lib/util';
	import toast from 'svelte-french-toast';

	let pack: MissionPack = {
		name: '',
		steamId: '',
		uploadedBy: null,
		dateAdded: new Date()
	};

	let idInvalid = false;
	let nameInvalid = false;
	let valid = false;
	let inputtedId = '';
	$: {
		pack.steamId = getSteamID(inputtedId);
		valid = !idInvalid && !nameInvalid && pack.name.length > 0 && pack.steamId.length > 0;
	}

	function validateMissionPackName(str: string): string | boolean {
		if (str.toLowerCase() === 'toc') return 'That name is not allowed';
		else if (str.trim().length < 1) return 'Name must not be blank';
		return true;
	}

	function upload() {
		pack.name = pack.name.trim();
		fetch('/upload/missionpack', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify(pack)
		})
			.then(response => {
				if (response.ok) {
					response.text().then(text => {
						toast.success(text);
					});
				} else {
					response.text().then(text => {
						toast.error(text);
					});
				}
			})
			.catch(() => toast.error('An error occurred.'));
	}
</script>

<div class="block flex grow">
	<Input
		label="Name"
		id="pack-name"
		validate={validateMissionPackName}
		required
		bind:invalid={nameInvalid}
		bind:value={pack.name} />
	<Input
		label="Steam ID / Workshop URL"
		id="pack-steam-id"
		validate={validateSteamID}
		required
		bind:invalid={idInvalid}
		bind:value={inputtedId} />
</div>
<div class="block">
	<button on:click={upload} disabled={!valid}>Upload</button>
</div>
