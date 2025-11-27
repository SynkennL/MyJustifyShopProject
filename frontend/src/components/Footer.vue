<template>
  <footer class="bg-gray-900 text-gray-200 pt-12">
    <div class="container mx-auto px-4">
      <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
        <!-- Logo & Hakkımızda -->
        <div>
          <h2 class="text-xl font-bold mb-4">JustifyShop</h2>
          <p class="text-gray-400 text-sm">
            En trend ürünler, güvenli alışveriş ve hızlı teslimat ile sizlere en iyi deneyimi sunuyoruz.
          </p>
        </div>

        <!-- Kategoriler -->
        <div>
          <h3 class="font-semibold mb-4">Kategoriler</h3>
          <ul class="space-y-2 text-gray-400">
            <li><a href="#" class="hover:text-white">Erkek Giyim</a></li>
            <li><a href="#" class="hover:text-white">Kadın Giyim</a></li>
            <li><a href="#" class="hover:text-white">Ayakkabı</a></li>
            <li><a href="#" class="hover:text-white">Aksesuar</a></li>
            <li><a href="#" class="hover:text-white">Çocuk Giyim</a></li>
          </ul>
        </div>

        <!-- Müşteri Hizmetleri -->
        <div>
          <h3 class="font-semibold mb-4">Müşteri Hizmetleri</h3>
          <ul class="space-y-2 text-gray-400">
            <li><a href="#" class="hover:text-white">İletişim</a></li>
            <li><a href="#" class="hover:text-white">Sıkça Sorulan Sorular</a></li>
            <li><a href="#" class="hover:text-white">Teslimat & İade</a></li>
            <li><a href="#" class="hover:text-white">Gizlilik Politikası</a></li>
            <li><a href="#" class="hover:text-white">Kullanım Koşulları</a></li>
          </ul>
        </div>

        <!-- Bülten & Sosyal Medya -->
        <div>
          <h3 class="font-semibold mb-4">Bültene Abone Ol</h3>
          <form class="flex flex-col space-y-2">
            <input type="email" placeholder="E-posta adresiniz" class="px-3 py-2 rounded text-gray-800" />
            <button class="bg-blue-600 hover:bg-blue-700 text-white px-3 py-2 rounded">Abone Ol</button>
          </form>

          <div class="mt-6 flex space-x-4">
            <a href="#" class="hover:text-white">
              <i class="fab fa-facebook-f"></i> Facebook
            </a>
            <a href="#" class="hover:text-white">
              <i class="fab fa-instagram"></i> Instagram
            </a>
            <a href="#" class="hover:text-white">
              <i class="fab fa-twitter"></i> Twitter
            </a>
          </div>
        </div>
      </div>

      <div class="border-t border-gray-700 mt-8 pt-4 text-center text-gray-500 text-sm">
        © 2025 JustifyShop. Tüm hakları saklıdır.
      </div>
    </div>
  </footer>
</template>

<script setup lang="ts">
// Şimdilik script gerekli değil, footer statik
</script>

<style scoped>
/* FontAwesome kullanacaksan global eklemen lazım */
</style>
