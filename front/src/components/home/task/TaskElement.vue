<template>
    <li class="project-element">
        <span>
            <p>Project name</p>
            <h4>{{project.name}}</h4>
        </span>
        <span>
            <p>Start at</p>
            <h4>{{project.start_date}}</h4>
        </span>
        <span>
            <p>Deadline</p>
            <h4>{{project.end_date}}</h4>
        </span>
        <span>
            <p>Member</p>
            <ol>
                <li v-for="(member, index) in project.members"
                    v-bind:key="index"
                    v-bind:style="{
                        right: index/2+'rem',
                        backgroundColor: member.color
                    }">
                </li>
            </ol>
        </span>
        <span>
            <p>Project status</p>
            <h4>{{project.status}}</h4>
        </span>
        <div>
            <button @click="menuToggle">
                <i class="material-icons-outlined">more_vert</i>
            </button>
            <ol ref="menu">
                <li>
                    <button>
                        <i class="material-icons-outlined">edit</i>
                        <p>Edit</p>
                    </button>
                </li>
                <li>
                    <button style="color: #ff0000">
                        <i class="material-icons-outlined">delete</i>
                        <p>Delete</p>
                    </button>
                </li>
            </ol>
        </div>
    </li>
</template>

<script>

export default {
    props: ["project"],
    methods : {
        menuToggle: function() {
            this.$refs.menu.classList.toggle("on");
        }
    }
}
</script>

<style lang="scss" scoped>
li.project-element {
    display: flex;
    align-items: center;
    padding: 0.7rem 1rem;
    border: 1px solid #e3e8ee;
    border-radius: 0.7rem;
    margin-bottom: 0.7rem;
    transition-duration: 0.2s;
    cursor: pointer;
    &:hover {
        box-shadow: 2px 2px 7px #00000020;
    }
    > span {
        flex-grow: 1;

        > p {
            font-size: 0.75rem;
            font-weight: 500;
            color: #aaa;
            margin-bottom: 4px;
        }
        > h4 {
            font-size: 1rem;
            font-weight: 600;
        }
        // member
        > ol {
            display: flex;
            align-items: center;

            > li {
                position: relative;
                width: 2rem;
                height: 2rem;
                background: #ddd;
                border-radius: 50%;
                border: 1px solid #fff;
            }
        }
    }

    > div {
        display: flex;
        flex-direction: column;
        align-items: flex-end;
        position: relative;
        button {
            all: unset;
            cursor: pointer;

        }
        > ol {
            display: none;
            flex-direction: column;
            position: absolute;
            top: 2rem;
            background-color: #fff;
            border-radius: 4px;
            border: 1px solid #e3e8ee;
            box-shadow: 2px 2px 7px #00000020;
            z-index: 111;
            &.on {
                display: flex;
            }
            > li {
                border-bottom: 1px solid #e3e8ee;
                &:last-of-type {
                    border-bottom: 1px solid #e3e8ee;
                }
                > button {
                    display: flex;
                    align-items: center;
                    padding: 0.3rem;
                    
                    > i {
                        font-size: 1.3rem;
                        margin-right: 0.3rem;
                    }
                    > p {
                        font-size: 0.9rem;
                        font-weight: 500;
                    }
                }
            }
        }
    }
}
</style>