<script>
	import { onMount } from "svelte";
    import { query } from "../lib/queries.js"

    async function getQuery() {
        let bars;
        await query("SELECT * FROM bar", function(/** @type {any} */ result){
            console.log(result);
            bars = result;
        });
        console.log(bars);
    }

    $: getQuery();
    
</script>

{#await getQuery}
<div>Waiting...</div>
{:then q}
<div>Header</div>
<slot/>
<div>Footer</div>
{/await}
