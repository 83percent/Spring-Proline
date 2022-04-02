export default {
    state: () => {
        return {
            isLogin: false,
            color: "#333399",
            name : "Jaehoon Lee",
            email: "hoonni2709@naver.com"
        }
    },
    getters: {
        userInfo: (state) => state
    },
    mutations: {
        login (state, payload) {
            const {isLogin} = payload;
            if(isLogin) {
                state.isLogin = true;
            } else {
                state.isLogin = false;
            }
        }
    }
}