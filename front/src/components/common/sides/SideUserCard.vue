<template>
    <div id="user-card-wrap">
        <div class="user-image-frame">
            <div :style="{'background-color' : userInfo.color}"></div>
        </div>
        <div class="user-info-frame">
            <h3>{{userInfo.name}}</h3>
            <p>{{userInfo.email}}</p>
        </div>
    </div>
</template>

<script>
export default {
    data: function() {
        return {
            userInfo : this.$store.state.UserInfo
        }
    },
}
</script>

<style lang="scss" scoped>
#user-card-wrap {
    display: flex;
    align-items: center;
    margin-top: 1rem;
    padding: 0.7rem;
    background-color: #fff;
    border-radius: 0.7rem;
    transition-duration: 0.2s;
    cursor: pointer;

    &:hover {
        box-shadow: 2px 2px 7px #00000010;
    }
    > .user-image-frame {
        margin-right: 0.4rem;
        > div {
            border-radius: 50%;
            width: 2.5rem;
            height: 2.5rem;
            background-color: #4698f3;
        }
    }
    > .user-info-frame {
        > h3 {
            font-size: 0.95rem;
            font-weight: 600;            
        }
        > p {
            font-size: 0.8rem;
            font-weight: 400;
            color: #888;
        }
    }
}
</style>