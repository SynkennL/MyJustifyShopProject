<script setup lang="ts">
import { ref } from 'vue'

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
  <nav class="bg-white shadow-md fixed w-full z-50">
    <div class="container mx-auto px-4 py-3 flex items-center justify-between">
      
      <!-- Logo -->
      <div class="text-2xl font-bold text-gray-800">
        <a href="#">JustifyShop</a>
      </div>

      <!-- Desktop Menu -->
      <ul class="hidden md:flex items-center space-x-6">
        
        <!-- Kategoriler Dropdown -->
        <li class="relative">
          <button @click="toggleDropdown" class="flex items-center gap-1 hover:text-blue-600">
            Kategoriler
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
            </svg>
          </button>

          <ul
            v-show="isDropdownOpen"
            class="absolute left-0 mt-2 w-40 bg-white shadow-lg rounded-md py-2"
          >
            <li><a href="#" class="block px-4 py-2 hover:bg-gray-100">Erkek Giyim</a></li>
            <li><a href="#" class="block px-4 py-2 hover:bg-gray-100">Kadın Giyim</a></li>
            <li><a href="#" class="block px-4 py-2 hover:bg-gray-100">Ayakkabı</a></li>
            <li><a href="#" class="block px-4 py-2 hover:bg-gray-100">Aksesuar</a></li>
            <li><a href="#" class="block px-4 py-2 hover:bg-gray-100">Çocuk Giyim</a></li>
          </ul>
        </li>

        <li><a href="#" class="hover:text-blue-600">Hakkımızda</a></li>
        <li><a href="#" class="hover:text-blue-600">İletişim</a></li>
        <li><a href="#" class="hover:text-blue-600">Sepetim</a></li>
        <li><a href="#" class="hover:text-blue-600">Kayıt Ol</a></li>
      </ul>

      <!-- Mobile Menu Button -->
      <button @click="toggleMobileMenu" class="md:hidden text-gray-700 focus:outline-none">
        <svg v-if="!isMobileMenuOpen" xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none"
             viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M4 6h16M4 12h16M4 18h16"/>
        </svg>

        <svg v-else xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none"
             viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M6 18L18 6M6 6l12 12"/>
        </svg>
      </button>
    </div>

    <!-- Mobile Menu -->
    <div v-show="isMobileMenuOpen" class="md:hidden bg-white shadow-md">
      <ul class="flex flex-col px-4 py-2 space-y-2">
        
        <!-- Mobil Dropdown -->
        <li>
          <button @click="toggleDropdown" class="flex items-center gap-1 w-full">
            Kategoriler
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
            </svg>
          </button>

          <ul v-show="isDropdownOpen" class="pl-4 mt-1 space-y-1">
            <li><a href="#" class="block px-2 py-1 hover:bg-gray-100 rounded">Erkek Giyim</a></li>
            <li><a href="#" class="block px-2 py-1 hover:bg-gray-100 rounded">Kadın Giyim</a></li>
            <li><a href="#" class="block px-2 py-1 hover:bg-gray-100 rounded">Ayakkabı</a></li>
            <li><a href="#" class="block px-2 py-1 hover:bg-gray-100 rounded">Aksesuar</a></li>
            <li><a href="#" class="block px-2 py-1 hover:bg-gray-100 rounded">Çocuk Giyim</a></li>
          </ul>
        </li>

        <li><a href="#" class="block px-2 py-1 hover:bg-gray-100 rounded">Hakkımızda</a></li>
        <li><a href="#" class="block px-2 py-1 hover:bg-gray-100 rounded">İletişim</a></li>
        <li><a href="#" class="block px-2 py-1 hover:bg-gray-100 rounded">Sepetim</a></li>
        <li><a href="#" class="block px-2 py-1 hover:bg-gray-100 rounded">Kayıt Ol</a></li>
      </ul>
    </div>
  </nav>
</template>

<style scoped>
ul[v-show] {
  transition: all 0.2s ease-in-out;
}
</style>
