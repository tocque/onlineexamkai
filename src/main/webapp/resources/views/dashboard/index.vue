<template>
  <div class="dashboard-container">
    <component :is="currentRole"></component>
  </div>
</template>

<script>
import UserDashboard from './User.vue'

export default {
  name: 'Dashboard',
  components: { UserDashboard },
  data() {
    return {
      currentRole: 'UserDashboard'
    }
  },
}
</script>
