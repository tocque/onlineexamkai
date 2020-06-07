<template>
    <div style="padding: 20px">
        <h3>{{ title }}</h3>
        <el-card v-if="singleQuestion.num > 0">
            <div slot="header" class="clearfix">
                <span>单选题 共{{ singleQuestion.score * singleQuestion.num }}分</span>
            </div>
            <el-card v-for="q of singleQuestion.questions" :key="q.qid">
                <div slot="header" class="clearfix">
                    <span>{{ q.title }}</span>
                </div>
                <div style="display: flex; justify-content: space-around">
                    <el-radio :value="q.choice" label="A">{{ q.selection[0] }}</el-radio>
                    <el-radio :value="q.choice" label="B">{{ q.selection[1] }}</el-radio>
                    <el-radio :value="q.choice" label="C">{{ q.selection[2] }}</el-radio>
                    <el-radio :value="q.choice" label="D">{{ q.selection[3] }}</el-radio>
                </div>
                <p>正确答案: {{ q.answer }}</p>
            </el-card>
        </el-card>
    </div>
</template>

<script>
export default {
    data() {
        return {
            ...examinfo,
            type: window.type
        }
    },
}
</script>

<style>

</style>