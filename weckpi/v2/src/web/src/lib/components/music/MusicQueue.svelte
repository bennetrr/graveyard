<script lang="ts">
    import {debug} from "debug";

    import Fa from "svelte-fa/src/fa.svelte";
    import {faPlay} from "@fortawesome/free-solid-svg-icons";

    import appState from "$lib/app-state/app-state";
    import {minutesToTime} from "$lib/utilities/DateTime";

    const log = debug("weckPiWeb:ui:musicQueue");
</script>

<div class="bg-surface-100-800-token p-4 h-full w-[450px]">
    {#each $appState.music.queue as queueElement, i}
        <button class="w-full flex flex-row gap-4 overflow-hidden whitespace-nowrap my-3 p-3 bg-surface-200-700-token rounded-lg hover:brightness-[115%] cursor-pointer border-primary-50-900-token"
                class:border-2={i===$appState.music.queuePosition} on:click={() => appState.music.setQueuePosition(i)}>
            {#if i === $appState.music.queuePosition}
                <Fa class="my-auto" icon={faPlay}/>
            {:else}
                <span class="my-auto">{i}</span>
            {/if}

            <img alt="Album Cover" class="h-[90px] rounded-lg" src={queueElement.image}>
            <div>
                <span class="font-bold">{queueElement.title}</span><br/>
                <span>{queueElement.artist}</span><br/>
                <span>{queueElement.album}</span><br/>
                <span>{minutesToTime(queueElement.duration)}</span>
            </div>
        </button>
    {/each}
</div>
