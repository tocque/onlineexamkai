<template>
  <el-card style="margin-bottom:20px;">
    <div slot="header" class="clearfix">
      <span>用户信息</span>
    </div>

    <div class="user-profile">
      <div class="box-center">
        <div class="user-name text-center" style="font: 14pt">{{ user.name }}</div> 
      </div>
    </div>

    <div class="user-bio">
      <div class="user-education user-bio-section">
        <div class="user-bio-section-header"><svg-icon icon-class="education"></svg-icon><span>专业</span></div>
        <div class="user-bio-section-body">
          <div class="text-muted">
            {{ user.subject }}
          </div>
        </div>
      </div>
    </div>
  </el-card>
</template>

<script>
import PanThumb from '../../../components/PanThumb/index.vue'
import "./usercard.css"

export default {
  components: { PanThumb },
  props: {
    user: {
      type: Object,
      default: () => {
        return {
          name: '',
          tel: '',
          subject: '',
          role: ''
        }
      }
    }
  }
}
</script>
