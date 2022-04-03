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
                    <ol>
                        <li v-for="day in lastDay" v-bind:key="day">
                            <p>{{day}}</p>
                            <div></div>
                        </li>
                    </ol>
                    <!-- Task -->
                    <div v-for="(project, index) in projects"
                        v-bind:key="index"
                        v-bind:style="{
                            width: (project.size * 8)+'rem',
                            top: (2.3 + index*6) +'rem',
                            left: project.start_point * 8 + 'rem'
                        }">
                        <div></div>
                    </div>
                </div>
            </div>
        </article>

    </section>
</template>

<script>
import HomeTitle from '../common/HomeTitle.vue';


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
    components: { HomeTitle },
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
                console.log(element);
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
                    console.log("YEAR : ",end_date.getFullYear(), this.year, yearGap)
                    if(yearGap === 0) {
                        const monthGap = (end_date.getMonth()+1) - parseInt(this.month);
                        console.log("MONTH : ", end_date.getMonth()+1, this.month, monthGap)
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
                console.log(start_point, end_point);
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
    }
}
</script>

<style lang="scss" scoped>
$cal-width : 8rem;
$cal-height : 6rem;
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
                    height: $cal-height;
                    text-align: center;
                    line-height: $cal-height;
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
                    }
                }

                > div {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    position: absolute;
                    height: $cal-height;
                    > div {
                        width: 100%;
                        height: 4.5rem;
                        border: 1px solid #e3e8ee;
                        border-radius: 0.5rem;
                        background-color: #fff;
                        transition-duration: 0.2s;
                        cursor: pointer;

                        &:hover {
                            box-shadow: 2px 2px 7px #00000020;
                        }
                    }
                }
            }
        }
    }
    
}
</style>