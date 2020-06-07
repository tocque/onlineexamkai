<template>
  <div class="app-container" style="height: calc(100vh - 100px);">
    <iframe :src="$route.meta.path" scrolling="auto" frameborder="0" style="width:100%;height:100%;"></iframe>
  </div>
</template>

<script>

export default {
  name: 'Guide',
  data() {
    return {
    }
  },
  mounted() {
  },
  methods: {
  }
}
</script>
