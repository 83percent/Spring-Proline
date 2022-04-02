<template>
    <div id="side-menu-wrap">
        <p>Menu</p>
        <ul>
            <li>
                <router-link to="/">
                    <i class="material-icons-outlined">home</i>
                    <p>Home</p>
                </router-link>
            </li>
            <li>
                <router-link to="/Notifications">
                    <i class="material-icons-outlined">notifications</i>
                    <p>notifications</p>
                </router-link>
            </li>
            <li>
                <router-link to="/update">
                    <i class="material-icons-outlined">schedule</i>
                    <p>All Updates</p>
                </router-link>
            </li>
            <li>
                <router-link to="/profile">
                    <i class="material-icons-outlined">person</i>
                    <p>Profile</p>
                </router-link>
            </li>
        </ul>
    </div>
</template>

<script>
export default {

}
</script>

<style lang="scss" scoped>
#side-menu-wrap {
    margin-top: 1rem;
    & > P {
        font-size: 0.8rem;
        font-weight: 600;
        color: #aaa;
    }
    & > ul {
        margin-top: 0.5rem;
        li {
            margin: 0.1rem 0;
        }
        a {
            all: unset;
            display: flex;
            align-items: center;
            padding: 0.2rem;
            opacity: 0.4;
            cursor: pointer;
            transition: {
                duration: 0.3s;
            }
            &:hover {
                opacity: 1.0;
            }
            i {
                padding-right: 0.5rem;
                font-size: 1.5rem;
            }
            p {
                font-size: 1rem;
                font-weight: 500;
            }
        }
    }
}
        
</style>