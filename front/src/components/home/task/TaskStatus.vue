<template>
    <div>
        <h4 v-bind:class="'s'+status">{{getText}}</h4>
    </div>
</template>

<script>
export default {
    props: {
        status: {
            type: String,
            default: '04',
            required: true
        }
    },
    data: function() {
        return {
            
        }
    },
    computed: {
        getText: function() {
            const name = ["Completed", "In progress", "Not started", "Unknown"]
            return name[parseInt(this.$props.status)-1];
        }
    }
}
</script>

<style scoped>
div {
    display: flex;
    align-items: center;
}
h4 {
    width: 8rem;
    height: 1.8rem;
    padding-top: 2px;
    line-height: 1.8rem;
    text-align: center;
    font-size: 1rem;
    font-weight: 600;
    border-radius: 2rem;
}
h4.s01 {
    color: var(--status-01-font);
    background-color: var(--status-01-back);
}
h4.s02 {
    color: var(--status-02-font);
    background-color: var(--status-02-back);
}
h4.s03 {
    color: var(--status-03-font);
    background-color: var(--status-03-back);
}
</style>