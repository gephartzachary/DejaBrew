<script>
    import { query } from "../lib/queries.js"
    
    let bars = query("SELECT * FROM bar");
    
    console.log(bars);
</script>

<div>Header</div>
<slot/>
<div>Footer</div>
