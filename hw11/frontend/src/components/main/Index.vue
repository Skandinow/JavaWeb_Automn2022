<template>
  <div class="Start page">
    <IndexPost v-for="post in posts"
               :post="post"
               :key="post.id" />
<!--    :commentSize="Object.values(comments).filter(comment => comment.postId === post.id).length"-->
  </div>
</template>

<script>
import IndexPost from "@/components/main/post/IndexPost.vue";
import axios from "axios";

export default {
  name: "Index",
  components: {IndexPost},
  data: function () {
    return {
      posts: []
    }
  },
  beforeMount() {
    axios.get("/api/1/posts").then(response => {
      this.posts = response.data;
    });
  }
}
</script>

<style scoped>

</style>
