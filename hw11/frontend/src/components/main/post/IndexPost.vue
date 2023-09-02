<template>
  <div class="article">
    <div class="title">
      {{ post.title }}
    </div>
    <div class="body">
      {{ post.text }}
    </div>
<!--    <div class="footer right">-->
<!--      Comments: {{commentSize}}-->
<!--    </div>-->
  </div>
</template>

<script>
export default {
  name: "IndexPost",
  props: ["post"],
}
</script>
