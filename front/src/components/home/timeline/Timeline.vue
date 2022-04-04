<template>
    <section>
        <home-title>Projects Timeline</home-title>
        <article>
            <div class="header">
                <div>
                    <button>
                        <p>{{year}}</p>
                        <i class="material-icons-outlined">expand_more</i>
                    </button>
                </div>
                <div>
                    <button>
                        <p>{{month}}</p>
                        <i class="material-icons-outlined">expand_more</i>
                    </button>
                </div>
            </div>
            <div class="main">
                <ul class="project-title">
                    <li>
                        <p>Tasks</p>
                    </li>
                    <li v-for="(project, index) in projectGraphs" v-bind:key="index" class="project-element">
                        <p>{{project.name}}</p>
                    </li>
                    <li>
                        <button>
                            <i class="material-icons-outlined">add</i>
                            <p>New</p>   
                        </button>
                    </li>
                </ul>
                <div class="cal">
                    <!-- Calendar Background -->
                    <ol ref="calendar">
                        <li v-for="day in lastDay" v-bind:key="day">
                            <p>{{day}}</p>
                            <div></div>
                        </li>
                    </ol>
                    <!-- Task -->
                    <timeline-element
                        v-for="(project, index) in projects"
                        v-bind:key="index"
                        v-bind:project="project"
                        v-bind:index="index">
                    </timeline-element>
                </div>
            </div>
        </article>

    </section>
</template>

<script>
import HomeTitle from '../common/HomeTitle.vue';
import TimelineElement from './TimelineElement.vue';

const [year, month, lastDay, firstDate] = (() => { // 연, 월, 마지막일, 첫 일의 요일
    let date    = new Date(),
        year    = date.getFullYear(),
        month   = date.getMonth(),
        lastDay = 0,
        firstDate = new Date(year, month, 1).getDay();
    lastDay = new Date(year, month+1, 0).getDate();
    return [year, month+1, lastDay, firstDate];
})();

export default {
    components: { HomeTitle, TimelineElement },
    props: {
        projects: {type:Array, required: true}
    },
    data: function() {
        return {
            year, month, lastDay, firstDate,
            date_eng : ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
        }
    },
    computed : {
        projectGraphs : function() {
            return Object.values(this.$props.projects).reduce((acc, element) => {
                const start_date = new Date(element.start_date);
                const end_date = new Date(element.end_date);
                const start_point = (() => {
                    const yearGap = start_date.getFullYear() - parseInt(this.year);
                    if(yearGap === 0) {
                        const monthGap = (start_date.getMonth()+1) - parseInt(this.month);
                        if(monthGap === 0) {
                            return start_date.getDate()-1;
                        } else if(monthGap < 0) {
                            return 0;
                        }
                    } else if(yearGap < 0) {
                        return 0;
                    }
                    return -1;
                })();
                const end_point = (() => {
                    const yearGap = end_date.getFullYear() - parseInt(this.year);
                    if(yearGap === 0) {
                        const monthGap = (end_date.getMonth()+1) - parseInt(this.month);
                        if(monthGap === 0) {
                            return end_date.getDate();
                        } else if(monthGap > 0) {
                            return this.lastDay;
                        }
                    } else if(yearGap > 0) {
                        return this.lastDay;
                    }
                    return -1;
                })();
                if(start_point === -1 || end_point === -1) {
                    element.size = -1;
                } else {
                    element.size = (end_point - start_point);
                    element.start_point = start_point;
                    element.end_point = end_point;
                }
                acc.push(element);
                return acc;
            }, []);
        }
    }, // computed
    mounted: function() {
        const calendar = this.$refs.calendar;
        if(calendar) {
            const frame = calendar.children[new Date().getDate()-1];
            frame.classList.add("today");
        }
    }
}
</script>

<style lang="scss" scoped>
$cal-width : 7rem;
$cal-height : 5rem;
section {
    margin-bottom: 2rem;
    > article {
        display: flex;
        flex-direction: column;
        border: 1px solid #e3e8ee;
        border-radius: 1rem;
        // Time Line Frame
        > div.header {
        display: flex;
        align-items: center;
        padding-left: 1rem;
        border-bottom: 1px solid #e3e8ee;
            // Date
            > div {
                padding: 0.5rem;
                > button {
                    all: unset;
                    display: flex;
                    align-items: center;
                    cursor: pointer;
                    > p {
                        font-size: 1.1rem;
                        font-weight: 600;
                    }
                    > i {
                        font-size: 1.2rem;
                        padding-left: 5px;
                        transition-duration: 0.2s;
                        opacity: 0.4;
                    }
                    &:hover > i {
                        opacity: 1.0;
                    }
                }
            }
        }
        // Calendar
        .main {
            display: flex;
            > ul {
                width: 8rem;
                border-right: 1px solid #e3e8ee;
                
                > li:first-of-type {
                    height: 2.3rem;
                    line-height: 2.3rem;
                    text-align: center;
                    border-bottom: 1px solid #e3e8ee;
                }
                > li.project-element {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    height: $cal-height;
                    text-align: center;
                    
                }
                > li {
                    > p {
                        font-size: 0.9rem;
                        font-weight: 600;
                    }

                    // New Button
                    > button {
                        all: unset;
                        display: flex;
                        margin: 0 auto;
                        margin-bottom: 0.8rem;
                        border-radius: 4px;
                        align-items: center;
                        background-color: #ddd;
                        color: #888;
                        padding: 0.3rem 1.5rem;
                        cursor: pointer;
                        > i {
                            font-size: 1.0rem;
                        }
                        > p {
                            font-size: 0.75rem;
                        }
                    }
                }
            }
            > .cal {
                background-color: #eeeff1;
                position: relative;
                width: 100%;
                overflow-y: hidden;
                overflow-x: scroll;

                // Calendar backgorund
                > ol {
                    display: flex;
                    height: 100%;
                    > li {
                        min-width: $cal-width;
                        font-size: 0.9rem;
                        font-weight: 600;
                        border-right: 1px solid #ccc;
                        > p {
                            text-align: center;
                            height: 2.3rem;
                            line-height: 2.3rem;
                            border-bottom: 1px solid #ccc;
                        }
                        &:last-of-type {
                            border: none;
                        }
                        &.today {
                            background-color: #dde4ee;
                        }
                    }
                }
            }
        }
    }
}
</style>