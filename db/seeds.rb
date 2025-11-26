AdminUser.create!(
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password"
) if AdminUser.count == 0

# -------------------------------------------
# Create Categories
# -------------------------------------------

category_names = [
  "Mechanical Keyboards",
  "Mice",
  "Workspace",
  "Lighting",
  "Digital"
]

categories = {}
category_names.each do |name|
  categories[name] = Category.find_or_create_by!(name: name)
end

# -------------------------------------------
# Product List
# -------------------------------------------

products = [
  {
    name: "Keychron K8 Pro Mechanical Keyboard",
    description: "Wireless mechanical keyboard with hot-swappable switches.",
    base_price: 119.99,
    stock_quantity: 50,
    product_type: "physical",
    category_id: categories["Mechanical Keyboards"].id
  },
  {
    name: "Logitech MX Master 3S",
    description: "Ergonomic productivity mouse with 8 programmable buttons.",
    base_price: 99.99,
    stock_quantity: 80,
    product_type: "physical",
    category_id: categories["Mice"].id
  },
  {
    name: "ErgoLift Laptop Stand",
    description: "Adjustable aluminum laptop stand for better posture.",
    base_price: 49.99,
    stock_quantity: 60,
    product_type: "physical",
    category_id: categories["Workspace"].id
  },
  {
    name: "NeoWave Desk Mat",
    description: "Soft, anti-slip desk mat with minimalist dev print.",
    base_price: 29.99,
    stock_quantity: 100,
    product_type: "physical",
    category_id: categories["Workspace"].id
  },
  {
    name: "Elgato Developer Lighting Kit",
    description: "LED lighting setup perfect for coding and video calls.",
    base_price: 149.99,
    stock_quantity: 20,
    product_type: "physical",
    category_id: categories["Lighting"].id
  },
  {
    name: "Rails Starter Kit Pro",
    description: "Premium Rails boilerplate with authentication and admin UI.",
    base_price: 59.99,
    stock_quantity: 9999, # unlimited digital
    product_type: "digital",
    digital_file_url: "/downloads/rails_kit.zip",
    digital_file_size: 35,
    category_id: categories["Digital"].id
  },
  {
    name: "JavaScript UI Components Pack",
    description: "Reusable UI components for modern JS frameworks.",
    base_price: 39.99,
    stock_quantity: 9999,
    product_type: "digital",
    digital_file_url: "/downloads/js_components.zip",
    digital_file_size: 24,
    category_id: categories["Digital"].id
  },
  {
    name: "DevIcon Pack 2025",
    description: "200+ SVG icons for web development projects.",
    base_price: 19.99,
    stock_quantity: 9999,
    product_type: "digital",
    digital_file_url: "/downloads/iconpack.zip",
    digital_file_size: 12,
    category_id: categories["Digital"].id
  },
  {
    name: "Full-Stack Web Dev PDF Textbook",
    description: "400-page reference textbook covering Rails, JS, SQL, and more.",
    base_price: 24.99,
    stock_quantity: 9999,
    product_type: "digital",
    digital_file_url: "/downloads/textbook.pdf",
    digital_file_size: 55,
    category_id: categories["Digital"].id
  },
  {
    name: "Ultimate Wireframe UX Kit",
    description: "Drag-and-drop UX components for prototyping.",
    base_price: 34.99,
    stock_quantity: 9999,
    product_type: "digital",
    digital_file_url: "/downloads/wireframekit.zip",
    digital_file_size: 40,
    category_id: categories["Digital"].id
  }
]

products.each do |product|
  Product.create!(product)
end
