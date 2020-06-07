<template>
  <div class="navbar">
    <hamburger id="hamburger-container" :is-active="sidebar.opened" class="hamburger-container" @toggle-click="toggleSideBar"></hamburger>

    <breadcrumb id="breadcrumb-container" class="breadcrumb-container"></breadcrumb>

    <div class="right-menu">
      <template v-if="device!=='mobile'">
        <search id="header-search" class="right-menu-item"></search>

        <error-log class="errLog-container right-menu-item hover-effect"></error-log>

        <screenfull id="screenfull" class="right-menu-item hover-effect"></screenfull>

        <el-tooltip content="Global Size" effect="dark" placement="bottom">
          <size-select id="size-select" class="right-menu-item hover-effect"></size-select>
        </el-tooltip>

      </template>

      <el-dropdown class="avatar-container right-menu-item hover-effect" trigger="click">
        <div class="avatar-wrapper">
          <span style="font-size: 14pt;">{{ name }}</span>
          <i class="el-icon-caret-bottom"></i>
        </div>
        <el-dropdown-menu slot="dropdown">
          <router-link to="/profile/index">
            <el-dropdown-item>我的</el-dropdown-item>
          </router-link>
          <router-link to="/">
            <el-dropdown-item>主页</el-dropdown-item>
          </router-link>
          <el-dropdown-item divided @click.native="logout">
            <span style="display:block;">退出登录</span>
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </div>
</template>

<script>
import 'navbar.css'
import Breadcrumb from '../../components/Breadcrumb/index.vue'
import Hamburger from '../../components/Hamburger/index.vue'
import ErrorLog from '../../components/ErrorLog/index.vue'
import Screenfull from '../../components/Screenfull/index.vue'
import SizeSelect from '../../components/SizeSelect/index.vue'
import Search from '../../components/HeaderSearch/index.vue'

export default {
  components: {
    Breadcrumb,
    Hamburger,
    ErrorLog,
    Screenfull,
    SizeSelect,
    Search
  },
  computed: {
    ...Vuex.mapGetters([
      'sidebar',
      'name',
      'device'
    ])
  },
  methods: {
    toggleSideBar() {
      this.$store.dispatch('app/toggleSideBar')
    },
    async logout() {
      await this.$store.dispatch('user/logout')
    }
  }
}
</script>

