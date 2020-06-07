// import { login, logout, getInfo } from '@/api/user'
import { getToken, setToken, removeToken } from '../../utils/auth.js'
import router, { resetRouter } from '../../router/index.js'

const state = {
  token: getToken(),
  name: '',
  tel: '',
  introduction: '',
  roles: [],
  truename: '',
  subject: '',
}

const mutations = {
  SET_TOKEN: (state, token) => {
    state.token = token
  },
  SET_INTRODUCTION: (state, introduction) => {
    state.introduction = introduction
  },
  SET_SUBJECT: (state, subject) => {
    state.subject = subject
  },
  SET_NAME: (state, name) => {
    state.name = name
  },
  SET_TRUENAME: (state, truename) => {
    state.truename = truename
  },
  SET_TEL: (state, tel) => {
    state.tel = tel
  },
  SET_ROLES: (state, roles) => {
    state.roles = roles
  }
}

const actions = {
  // user login
  login({ commit }, userInfo) {
    const { username, password } = userInfo
    return new Promise((resolve, reject) => {
      login({ username: username.trim(), password: password }).then(response => {
        const { data } = response
        commit('SET_TOKEN', data.token)
        setToken(data.token)
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },

  // get user info
  getInfo({ commit, state }) {
    commit('SET_ROLES', window.roles)
    if (window.roles.includes("学生")) {
      return axios.post("get_current")
        .then(async({ data }) => {
          if (!data || data.type !== 'success') {
            throw new Error('身份验证失败, 请重新登录')
          }
          const { username, truename } = data

          // roles must be a non-empty array
          // if (!roles || roles.length <= 0) {
          //   reject('getInfo: roles must be a non-null array!')
          // }

          commit('SET_NAME', username)
          commit('SET_TRUENAME', truename)
          return axios.get("profile")
        })
        .then(({ data }) => {
          const { tel, subject } = eval(data);
          console.log(data);
          commit('SET_TEL', tel)
          commit('SET_SUBJECT', subject)
          return { roles: window.roles };
        })
    } else {
      return axios.get("welcome").then(({ data }) => {
        const { name } = eval(data);
          commit('SET_NAME', name);
        return { roles: window.roles };
      })
    }
  },

  // user logout
  logout({ commit, state, dispatch }) {
    return new Promise((resolve, reject) => {
      window.location.href = "logout";
      resolve();
      // logout(state.token).then(() => {
      //   commit('SET_TOKEN', '')
      //   commit('SET_ROLES', [])
      //   removeToken()
      //   resetRouter()

      //   // reset visited views and cached views
      //   // to fixed https://github.com/PanJiaChen/vue-element-admin/issues/2485
      //   dispatch('tagsView/delAllViews', null, { root: true })

      //   resolve()
      // }).catch(error => {
      //   reject(error)
      // })
    })
  },

  // remove token
  resetToken({ commit }) {
    return new Promise(resolve => {
      commit('SET_TOKEN', '')
      commit('SET_ROLES', [])
      removeToken()
      resolve()
    })
  },

  // dynamically modify permissions
  changeRoles({ commit, dispatch }, role) {
    return new Promise(async resolve => {
      const token = role + '-token'

      commit('SET_TOKEN', token)
      setToken(token)

      const { roles } = await dispatch('getInfo')

      resetRouter()

      // generate accessible routes map based on roles
      const accessRoutes = await dispatch('permission/generateRoutes', roles, { root: true })

      // dynamically add accessible routes
      router.addRoutes(accessRoutes)

      // reset visited views and cached views
      dispatch('tagsView/delAllViews', null, { root: true })

      resolve()
    })
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
