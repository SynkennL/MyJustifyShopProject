-- 1. Users Tablosu
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  name VARCHAR(255),
  role VARCHAR(50) NOT NULL CHECK (role IN ('admin', 'customer')),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Categories Tablosu
CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Products Tablosu
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL,
  category_id INTEGER REFERENCES categories(id) ON DELETE SET NULL,
  image_url TEXT,
  seller_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Orders Tablosu
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  buyer_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  seller_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  product_id INTEGER NOT NULL REFERENCES products(id) ON DELETE RESTRICT,
  quantity INTEGER NOT NULL CHECK (quantity > 0),
  total_price DECIMAL(10, 2) NOT NULL,
  status VARCHAR(50) NOT NULL DEFAULT 'pending' 
    CHECK (status IN ('pending', 'confirmed', 'shipped', 'delivered', 'cancelled')),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- İndeksler (Performans için önerilen)
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_products_seller ON products(seller_id);
CREATE INDEX idx_orders_buyer ON orders(buyer_id);
CREATE INDEX idx_orders_seller ON orders(seller_id);
CREATE INDEX idx_orders_product ON orders(product_id);
CREATE INDEX idx_orders_status ON orders(status);


-- Kategorileri ekle
INSERT INTO categories (name, slug) VALUES
  ('Erkek Giyim', 'erkek-giyim'),
  ('Kadın Giyim', 'kadin-giyim'),
  ('Ayakkabı', 'ayakkabi'),
  ('Çocuk Giyim', 'cocuk-giyim');


-- Products tablosuna features kolonu ekle
ALTER TABLE products ADD COLUMN IF NOT EXISTS features JSONB;
