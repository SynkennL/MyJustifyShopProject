<template>
  <Navbar />
  <div class="pt-15 min-h-screen">
    <router-view />
  </div>
  <Footer />
</template>

<script setup lang="ts">
import Navbar from './components/Navbar.vue'
import Footer from './components/Footer.vue'
</script>
