<template>
  <div class="block">
    <el-timeline>
      <el-timeline-item v-for="(exam,index) of timeline" :key="index" :timestamp="exam.startTime" placement="top">
        <el-card>
          <h4><a :href="`review_exam?examId=${ exam.examId }&examPaperId=${ exam.id }`" target="_blank">{{ exam.name }}</a></h4>
          <p>
            <span>用时: {{ exam.useTime }} 分钟 ({{ exam.startTime }} - {{ exam.endTime }})</span>
            <span style="margin-left: 20px">分数: {{ exam.score }} / {{ exam.totalScore }}</span>
          </p>
        </el-card>
      </el-timeline-item>
    </el-timeline>
  </div>
</template>

<script>
export default {
  data() {
    return {
      timeline: []
    }
  },
  created() {
    axios.get("history_list").then(({ data }) => {
      const { history, page } = eval(data);
      this.timeline = history;
    })
  }
}
</script>
