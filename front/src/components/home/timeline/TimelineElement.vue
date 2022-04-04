<template>
    <div 
        class="timeline-element"
        v-bind:style="{
            width: (project.size * 7)+'rem',
            top: (2.3 + index*5) +'rem',
            left: project.start_point * 7 + 'rem'
        }">
        <div>
            <div class="info">
                <h4>{{project.name}}</h4>
                <p>{{project.explain}}</p>
            </div>
            <span v-bind:class="'s'+project.status"><span></span></span>
            <article ref="followBox">

            </article>
        </div>
        <div @mouseenter.stop.prevent="enter"
            @mousemove.stop.prevent="move"
            @mouseleave.stop.prevent="leave" class="hover-box"></div>
    </div>
</template>

<script>
export default {
    props: {
        index : {
            type: Number,
            required: true
        },
        project: {
            type: Object,
            required: true
        }
    },
    methods: {
        enter : function() {
            this.$refs.followBox.classList.add("on")
        },
        move: function(e) {
            const mouseX = e.offsetX;
            const mouseY = e.offsetY + 40;

            this.$refs.followBox.style.left = mouseX+"px";
            this.$refs.followBox.style.top = mouseY+"px";
            
        },
        leave: function() {
            this.$refs.followBox.classList.remove("on")
        }
    }
}
</script>

<style lang="scss" scoped>
$cal-width : 7rem;
$cal-height : 5rem;
div.timeline-element {
    display: flex;
    align-items: center;
    justify-content: center;
    position: absolute;
    height: $cal-height;
    // Project Bar
    > .hover-box {
        background-color: #00000000;
        position: absolute;
        width: 100%;
        &:hover {
            box-shadow: 2px 2px 7px #00000020;
        }
    }
    > div {
        display: flex;
        align-items: center;
        flex-grow: 1;
        height: 4rem;
        border: 1px solid #e3e8ee;
        border-radius: 0.5rem;
        background-color: #fff;
        transition-duration: 0.2s;
        cursor: pointer;

        // Project Information
        &:hover {
            box-shadow: 2px 2px 7px #00000020;
        }
        > .info {
            flex-grow: 1;
            > h4  {
                font-size: 1rem;
                font-weight: 600;
                margin-left: 1rem;
            }
            > p {
                font-size: 0.8rem;
                font-weight: 500;
                margin-left: 1rem;
                color: #888;
            }
        } // /Project Information
        // Status dot
        > span {
            position: relative;
            right: 1rem;
            width: 2rem;
            height: 2rem;
            background: #ddd;
            border-radius: 50%;
            z-index: 201;
            > span {
                position: absolute;
                top: 0.5rem;
                left: 0.5rem;
                width: 1rem;
                border-radius: 50%;
                height: 1rem;
                background: #aaa;
                z-index: 202;
            }

            &.s01 {
                background-color: var(--status-01-back);
                > span {
                    background-color: var(--status-01-font);
                }
            }
            &.s02 {
                background-color: var(--status-02-back);
                > span {
                    background-color: var(--status-02-font);
                }
            }
            &.s03 {
                background-color: var(--status-03-back);
                > span {
                    background-color: var(--status-03-font);
                }
            }
        } // /Status dot

        // Follow Box
        article {
            position: absolute;
            top: 0;
            left: 0;
            z-index: 203;
            display: none;
            width: 5rem;
            height: 5rem;
            background: #fff;
            border: 1px solid #e3e8ee;
            border-radius: 0.5rem;

            &.on {
                display: grid;
            }
        } // /Follow Box
    } // /Project Bar
}
</style>