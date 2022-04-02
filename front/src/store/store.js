import { createStore } from 'vuex';

import UserInfo from './modules/UserInfo';

export default createStore({
    modules: {
        UserInfo
    }
});
