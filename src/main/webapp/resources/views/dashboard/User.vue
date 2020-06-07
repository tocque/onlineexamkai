<template>
  <div class="dashboard-editor-container">
    <div class=" clearfix">
      <pan-thumb image="https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif" style="float: left">
        <span v-for="item in roles" :key="item" class="pan-info-roles">{{ item }}</span>
      </pan-thumb>
      <div class="info-container">
        <span class="display_name">{{ name }}【{{ truename }}】</span>
        <span style="font-size:20px;padding-top:20px;display:inline-block;">欢迎使用在线考试系统</span>
      </div>
    </div>
    <div>
      <img :src="emptyGif" class="emptyGif">
    </div>
  </div>
</template>

<script>
import PanThumb from '../../components/PanThumb/index.vue'

export default {
  name: 'UserDashboard',
  components: { PanThumb },
  data() {
    return {
      roles: [],
      emptyGif: 'https://wpimg.wallstcn.com/0e03b7da-db9e-4819-ba10-9016ddfdaed3'
    }
  },
  computed: {
    ...Vuex.mapGetters([
      "name",
      "truename"
    ])
  },
}
</script>

