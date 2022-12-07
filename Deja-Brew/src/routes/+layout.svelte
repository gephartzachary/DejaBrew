<script>
    import { connectDatabase } from "$lib/database";

    let database = connectDatabase();

    async function getData() {
        // @ts-ignore
        let results =  await database.query("SELECT * FROM bar", function (err, rows, fields) {
            if (err) throw err;
            console.log(fields);
            return new Promise(rows);
        });
        console.log(results);
    }

</script>

{#await getData}
    <div>Loading.... Please God</div>
{:then}
    <div>Header</div>
    <slot/>
    <div>Footer</div>
{/await}
