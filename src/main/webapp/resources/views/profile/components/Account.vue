<template>
  <el-form>
    <el-form-item label="名称">
      <el-input v-model.trim="user.name" />
    </el-form-item>
    <el-form-item label="手机号">
      <el-input v-model.trim="user.tel" />
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="submit">更新</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
import { toForm } from "../../../utils/shim.js"

export default {
  props: {
    user: {
      type: Object,
      default: () => {
        return {
          name: '',
          tel: ''
        }
      }
    }
  },
  methods: {
    submit() {
      const { name, tel } = this.user;
      if (name || tel) {
        axios.post("update_info", toForm({ trueName: name, tel }))
          .then((data) => {
            if(data.type == 'success') {
              this.$message({
                message: '更新个人信息成功',
                type: 'success',
                duration: 5 * 1000
              })
            } else {
              this.$notify.error(data.msg);
            }
          })
          .catch(() => {
            this.$notify.error('网络错误');
          });
      } else {
        this.$notify.error('网络错误');
      }
    }
  }
}
</script>
