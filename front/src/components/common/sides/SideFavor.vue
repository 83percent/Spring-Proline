<template>
    <div id="side-favor-wrap">
        <div class="header">
            <p>Favorites</p>
            <button title="Create Favorites Folder">
                <i class="material-icons-outlined">add_circle_outline</i>
            </button>
        </div>
    </div>
</template>

<script>
export default {

}
</script>

<style lang="scss" scoped>
#side-favor-wrap {
    flex-grow: 1;
    margin-top: 1rem;
    & > .header {
        display: flex;
        align-items: center;
        > p {
            font-size: 0.8rem;
            font-weight: 600;
            color: #aaa;
            flex-grow: 1;
        }
        > button {
            all: unset;
            cursor: pointer;
            > i {
                font-size: 1.5rem;
                opacity: 0.4;
                transition-duration: 0.3s;
                &:hover {
                    opacity: 1.0;
                }
            }
        }
    }
}
</style>