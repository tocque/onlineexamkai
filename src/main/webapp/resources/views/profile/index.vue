<template>
  <div class="app-container">
    <div v-if="user">
      <el-row :gutter="20">

        <el-col :span="6" :xs="24">
          <user-card :user="user"></user-card>
        </el-col>

        <el-col :span="18" :xs="24">
          <el-card>
            <el-tabs v-model="activeTab">
              <el-tab-pane label="正在进行" name="activity">
                <activity></activity>
              </el-tab-pane>
              <el-tab-pane label="参加过的" name="timeline">
                <timeline></timeline>
              </el-tab-pane>
              <el-tab-pane label="账户信息" name="account">
                <account :user="user"></account>
              </el-tab-pane>
            </el-tabs>
          </el-card>
        </el-col>

      </el-row>
    </div>
  </div>
</template>

<script>
import UserCard from './components/UserCard.vue'
import Activity from './components/Activity.vue'
import Timeline from './components/Timeline.vue'
import Account from './components/Account.vue'

export default {
  name: 'Profile',
  components: { UserCard, Activity, Timeline, Account },
  data() {
    return {
      user: {},
      activeTab: 'activity'
    }
  },
  computed: {
    ...Vuex.mapGetters([
      'name',
      'tel',
      'roles',
      'subject',
    ])
  },
  created() {
    this.getUser()
  },
  methods: {
    getUser() {
      this.user = {
        name: this.name,
        role: this.roles.join(' | '),
        tel: this.tel,
        subject: this.subject
      }
    }
  }
}
</script>
