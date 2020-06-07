import app from "./stores/app.js";
import tagsView from "./stores/tagsView.js";
import settings from "./stores/settings.js";
import errorLog from "./stores/errorLog.js";
import getters from "./getters.js";

const store = new Vuex.Store({
    modules: {
        app, tagsView, settings, errorLog
    },
    getters
})

export default store;