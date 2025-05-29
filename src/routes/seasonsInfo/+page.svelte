<script lang="ts">
	import { reservedSearchStrings } from '$lib/util';
</script>

<svelte:head>
	<title>Seasons</title>
</svelte:head>

<h1 class="header">Seasons</h1>
<div class="block">
	Participation in seasons is optional.
	If you intend to only submit your solves to the global leaderboard you can ignore the information in this page.
</div>

<div class="block">
	<h2>General Season Information</h2>

	<ul>
		<li>Every rule present in the rules page also applies to the seasons.</li>
		<li>Seasons are timed events that will last for approximately 3 months each. During each season, players will compete for who can solve the most bombs that fit certain criteria explained in this page.</li>
		<li>The leaderboard for the season is separate from the global leaderboard, and is available through the "Season" button on top of this page.</li>
		<li>The season leaderboards are not shared between seasons and players can only add solves to the leaderboard of a season during the 3 months that season is active.</li>
		<li>At the end of each season, the top 3 players of each of 3 different categories will receive a reward consisting of a special colored role in the KTANE official discord, as well as a colored nickname in this website. The 3 categories are: Distinct solves, EFM solves and team solves.</li>
		<li>If you want a solve to be considered for the ongoing season, you need to activate the respective checkmark during the upload of the solve.</li>
	</ul>

	<p>For solves to be valid for the season they need to respect the Permanent rules, which are rules that will be valid across all seasons, and Seasonal rules, which are rules that are only valid for the current season.</p>
	<p>The permanent rules are:</p>

	<ul>
		<li>Each player participating in a solve must record their POV and submit it as evidence during solve upload. Different roles require different screens recorded: Defuser must record the bomb and the audio communication with the experts. Experts must record any tools they use (this includes manuals, notepads, drawing tools and others). EFM solvers must record the bomb and any tools they use.</li>
		<li>Season solves must be of bombs submitted to this website within the 3 months prior to the current season's beginning date.</li>
	</ul>
</div>
<div class="block">
	<h2>Season 1</h2>
	<p>Season 1 will last from June 1st to August 31st (23:59 BST).</p>
	<p>The seasonal rule for season 1 is:</p>

	<ul>
		<li>Experts and EFM solvers can only use notepads with no extra functionalities other than taking notes, non-restricted <a href="https://ktane.timwi.de/">repository</a> manuals and calculators for basic arithmetic. Any other tool is not allowed.</li>
	</ul>
</div>
<div class="block">
	<h2>Frequently Asked Questions</h2>
	<ul>
		<li>Q: Are the extra functionalities in the <a href="https://samfundev.github.io/TextFieldCalculator/Calculator-v2.html">Text Field Calculator</a>, such as variable saving, allowed for season 1 solves?</li>
		<li>A: No. The TFC can be used for note taking and basic arithmetic, but no extra functionalities are allowed.</li>
	</ul>
	<ul>
		<li>Q: I submitted a solve to the site before the season started, but it fits the criteria required for the current season. Can it be used as a season solve?</li>
		<li>A: Yes, reupload it with the "season solve" checkmark activated.</li>
	</ul>
	<ul>
		<li>Q: Are base converters/caesar cipher decryptors allowed for season 1 solves?</li>
		<li>A: No.</li>
	</ul>
	<ul>
		<li>Q: For technical reasons one of the players can't fit their own POV in a single video. Can they submit more than 1 video as evidence?</li>
		<li>A: Yes.</li>
	</ul>
</div>

<style>
	a.link {
		color: var(--text-color);
	}
</style>
