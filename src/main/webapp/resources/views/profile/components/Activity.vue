<template>
  <div class="user-activity">
    <div class="post" v-for="exam of examList" :key="exam.id">
      <div class="user-block">
        <span class="username text-muted">{{ exam.name }}</span>
        <span class="description">{{ exam.startTime }} - {{ exam.endTime }}</span>
      </div>
      <p style="display: flex">
        <span>测试时长: {{ exam.totalTime }} 分钟</span>
        <span style="margin-left:20px">总分数: {{ exam.totalScore }}</span>
        <span style="margin-left:20px">及格分数: {{ exam.passScore }}</span>
        <el-button style="margin-left: auto; margin-right: 20px" 
          size="mini" :disabled="new Date(exam.startTime) > Date.now()" type="primary" @click="enterExam(exam.id)">
          <i class="el-icon-caret-right"></i>
          参加考试
        </el-button>
      </p>
    </div>
  </div>
</template>

<script>
import "activity.css"
import { toForm } from '../../../utils/shim.js'

const avatarPrefix = '?imageView2/1/w/80/h/80'
const carouselPrefix = '?imageView2/2/h/440'

export default {
  data() {
    return {
      carouselImages: [
      ],
      avatarPrefix,
      carouselPrefix,
      examList: []
    }
  },
  created() {
    axios.get("exam_list").then(({ data }) => {
      const { exam, page } = eval(data);
      console.log(exam);
      this.examList = exam;
    })
  },
  methods: {
    enterExam(eid) {
      axios.post("../exam/statr_exam", toForm({ "examId": eid })).then(({ data }) => {
        if (data.type == 'success') {
            window.location = "../exam/examing?examId=" + eid;
        } else {
          this.$notify.error(data.msg);
        }
      }).catch(() => {
        this.$notify.error('系统忙，请稍后再试');
      });
    }
  }
}
</script>
