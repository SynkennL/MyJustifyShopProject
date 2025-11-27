<script setup lang="ts">
import { ref } from 'vue'
import { RouterLink } from 'vue-router'

const isMobileMenuOpen = ref(false)
const isDropdownOpen = ref(false)

const toggleMobileMenu = () => {
  isMobileMenuOpen.value = !isMobileMenuOpen.value
}

const toggleDropdown = () => {
  isDropdownOpen.value = !isDropdownOpen.value
}
</script>

<template>
  <nav class="bg-gray-600 text-white">
    <div class="mx-auto px-10 flex justify-between items-center" style="height: 90px;">
      
      <!-- Logo -->
      <div>
      <RouterLink to="/">
        <img src="../assets/justifylogo.png" class="object-contain h-40 w-auto mt-3 ml-20 sm:ml-60" />
      </RouterLink>
      </div>

      <!-- Desktop Menu -->
      <ul class="hidden md:flex space-x-8 text-lg items-center">

        <li><RouterLink to="/" class="hover:text-gray-200">Anasayfa</RouterLink></li>

        <!-- DROPDOWN -->
        <li class="relative">
          <button @click="toggleDropdown" class="hover:text-gray-200 flex items-center gap-1">
            Kategoriler
            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2"
                 viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" 
                    d="M19 9l-7 7-7-7" />
            </svg>
          </button>

          <!-- Dropdown Menu -->
          <div
            v-if="isDropdownOpen"
            class="absolute left-0 mt-2 w-48 bg-white text-black rounded-lg shadow-lg overflow-hidden z-50"
          >
            <a href="#" class="block px-4 py-2 hover:bg-gray-100">Erkek Giyim</a>
            <a href="#" class="block px-4 py-2 hover:bg-gray-100">Kadın Giyim</a>
            <a href="#" class="block px-4 py-2 hover:bg-gray-100">Ayakkabı</a>
            <a href="#" class="block px-4 py-2 hover:bg-gray-100">Aksesuar</a>
            <a href="#" class="block px-4 py-2 hover:bg-gray-100">Çocuk Giyim</a>

          </div>
        </li>

        <li><a href="#" class="hover:text-gray-200">Hakkımızda</a></li>
        <li><a href="#" class="hover:text-gray-200">İletişim</a></li>
      </ul>

      <!-- Mobile Menu Button -->
      <button @click="toggleMobileMenu" class="md:hidden">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" fill="none"
             viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M4 6h16M4 12h16M4 18h16" />
        </svg>
      </button>
    </div>

    <!-- Mobile Menu -->
    <div v-if="isMobileMenuOpen" class="md:hidden bg-gray-700 px-4 pb-4">

      <ul class="space-y-3 text-lg">

        <li><RouterLink to="/" class="block py-2 hover:text-gray-200">Anasayfa</RouterLink></li>

        <!-- Mobile Dropdown -->
        <li>
          <button @click="toggleDropdown" class="w-full text-left py-2 flex justify-between">
            Kategoriler
            <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2"
                 viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" 
                    d="M19 9l-7 7-7-7" />
            </svg>
          </button>

          <div v-if="isDropdownOpen" class="bg-gray-800 rounded px-2 py-2">
            <a href="#" class="block py-2 pl-4 hover:text-gray-200">Erkek Giyim</a>
            <a href="#" class="block py-2 pl-4 hover:text-gray-200">Kadın Giyim</a>
            <a href="#" class="block py-2 pl-4 hover:text-gray-200">Aksesuar</a>
            <a href="#" class="block py-2 pl-4 hover:text-gray-200">Ayakkabı</a>
            <a href="#" class="block py-2 pl-4 hover:text-gray-200">Çocuk Giyim</a>
          </div>
        </li>

        <li><a href="#" class="block py-2 hover:text-gray-200">Hakkımızda</a></li>
        <li><a href="#" class="block py-2 hover:text-gray-200">İletişim</a></li>

      </ul>

    </div>
  </nav>
</template>

<style scoped>
</style>
