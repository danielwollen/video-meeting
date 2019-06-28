<template>
  <div>
    <NavbarMarketing v-if="type==='marketing'"/>
    <NavbarDashboard v-else-if="type==='dashboard'" :activeLink="activeLink"/>
  </div>
</template>

<script>
import NavbarMarketing from "../components/NavbarMarketing";
import NavbarDashboard from "../components/NavbarDashboard";

export default {
  components: {
    NavbarMarketing,
    NavbarDashboard
  },
  props: ['type', 'activeLink']
}
</script>

<style scoped>
</style>
