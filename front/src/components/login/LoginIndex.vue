<template>
    <div>
        <h1>Proline</h1>
        <ul>
            <li>
                <input v-model="id" type="text" placeholder="ID">
            </li>
            <li>
                <input v-model="password" type="password" placeholder="Password">
            </li>
            <li>
                <button>
                    <i class="material-icons-outlined" @click="login">check</i>
                </button>
            </li>
        </ul>
        <ul>
            <li>
                <router-link to="/join">Join Us</router-link>
            </li>
            <li>
                <router-link to="/join">Forgot my account...</router-link>
            </li>
        </ul>
    </div>
</template>
<script>
export default {
    data: function() {
        return {
            id: "",
            password: ""
        }
    },
    methods: {
        login: function() {
            this.$store.commit("login", {isLogin : true});
            this.$router.replace("/");
        }
    }
}
</script>

<style lang="scss" scoped>
div {
    display: flex;
    flex-direction: column;
    justify-content: center;
    position: relative;
    top: -1rem;
    left: 5rem;
    > h1 {
        font-size: 5.0rem;
        font-weight: 500;
        color: var(--point-color);
        margin-bottom: 2rem;
    }
    > ul {
        
        > li {
            margin-bottom: 1rem;
            > input {
                all: unset;
                width: 15rem;
                font-size: 1.1rem;
                border-bottom: 1px solid #888;
                padding: 0.2rem 0.6rem;
            }
            > button {
                all: unset;
                width: 2.5rem;
                height: 2.5rem;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #fff;
                background-color: var(--point-color);
                border-radius: 50%;
                cursor: pointer;
            }
        }
    }
}
</style>