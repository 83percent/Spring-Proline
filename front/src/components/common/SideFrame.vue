<template>
    <div id="side-wrap">
        <div>
            <div id="logo">
                <router-link to="/">
                    <p>Proline</p>
                </router-link>
            </div>
            <div class="search-wrap">
                <input type="text" placeholder="search">
            </div>
            <side-menu />
            <side-favor />
            <side-user-card />
        </div>
    </div>
</template>

<script>
import SideMenu from "./sides/SideMenu.vue";
import SideFavor from "./sides/SideFavor.vue";
import SideUserCard from "./sides/SideUserCard.vue"

export default {
    components : {SideMenu, SideFavor, SideUserCard}
}
</script>

<style lang="scss" scoped>
    #side-wrap {
        width: 16%;
        min-width: 19rem;
        height: 100%;
        // Frame
        > div {
            display: flex;
            flex-direction: column;
            height: 100%;
            padding: 1.5rem;
            background-color: #ecf0f3;
            border-right: 1px solid #e3e8ee;
            // Logo
            & > #logo {
                display: flex;
                & > a {
                    all: unset;
                    position: relative;
                    display: flex;
                    align-items: center;
                    margin: 0.5rem;
                    cursor: pointer;
                    & > p {
                        font-size: 1.8rem;
                        font-weight: 600;
                    }
                }
            }
    
            // Search
            & > .search-wrap {
                display: flex;
                flex-direction: column;
                margin-bottom: 0.5rem;
                & > input {
                    all: unset;
                    background-color: #fff;
                    font-size: 0.9rem;
                    padding: 0.5rem 0.7rem;
                    border: 1px solid #e3e8ee;
                    border-radius: 0.8rem;
                }
            }
        }
    }
</style>