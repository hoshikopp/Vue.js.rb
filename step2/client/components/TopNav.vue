<template lang='pug'>
.top-nav
  nuxt-link.title(to="/") demo_app
  el-dropdown.user-dropdown(trigger="click" v-if="currentUser")
    el-button.el-dropdown-link(type="text")
      img.avatar(:src="currentUser.image_url")
      span {{currentUser.name}}
      i.el-icon-arrow-down.el-icon--right
    el-dropdown-menu(slot="dropdown")
      el-dropdown-item(@click.native="profile") プロフィール
      el-dropdown-item(@click.native="logout") ログアウト
</template>
<script>
import TopNav from '~/components/TopNav.vue'
import { mapState } from 'vuex'
export default {
  components: {
    TopNav
  },
  computed: {
    ...mapState({
      currentUser: state => state.user.currentUser
    })
  },
  methods: {
    logout(){
      this.$store.dispatch('user/logout').then(()=>{
        location.reload()
      })
    },
    profile(){
      this.$router.push('/profile')
    }
  }
}
</script>
<style lang='sass'>
.top-nav
  padding: 0
  height: 60px
  width: 100%
  background-color: #fff
  box-shadow: 0 1px 3px rgba(0,0,0,0.2)
  .title
    padding: 16px
    line-height: 60px
    font-size: 20px
    font-weight: bold
    color: #666
    text-decoration: none

  .user-dropdown
    position: relative
    float: right
    padding: 11px 8px
    .avatar
      position: absolute
      top: 10px
      left: -30px
      width: 32px
      height: 32px
      display: inline-block
</style>
