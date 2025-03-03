import { useState } from "react";
import ProductCard from "../components/ProductCard";
import SearchBar from "../components/SearchBar";
import Filters from "../components/Filters";

const products = [
    { id: 1, name: "📱Smartphone", price: 600, category: "electronics" },
    { id: 2, name: "💻 Laptop", price: 1200, category: "electronics" },
    { id: 3, name: "👕 T-Shirt", price: 30, category: "fashion" },
    { id: 4, name: "👖 Jeans", price: 50, category: "fashion" },
    { id: 5, name: "📱 PhoneCase", price: 600, category: "electronics" },
    { id: 6, name: "🔊Blutooth", price: 600, category: "electronics" },
    { id: 7, name: "📚 Ikigai", price: 600, category: "book" },
    { id: 8, name: "📚 Never Lie", price: 600, category: "book" },
    { id: 9, name: "📚 Verity", price: 600, category: "book" },
    { id: 10, name: "👠Heels", price: 600, category: "shoes" },
    { id: 11, name: "👞 Sneakers", price: 600, category: "shoes" },
    { id: 12, name: "👟 Sports shoes", price: 600, category: "shoes" },
    { id: 13, name: "🧴Water Bottle", price: 600, category: "Daily-supplies" },
    { id: 14, name: "🏏 Cricket Bat", price: 600, category: "sports" },
    { id: 15, name: "🥽swimming Goggles", price: 600, category: "sports" },
    { id: 16, name: "🏊 Swimmimg Cap", price: 600, category: "Sports" },
    { id: 17, name: "📔NoteBook", price: 600, category: "study" },
];

const Home = () => {
    const [searchQuery, setSearchQuery] = useState("");
    const [category, setCategory] = useState("all");

    const filteredProducts = products.filter((product) =>
        (category === "all" || product.category === category) &&
        product.name.toLowerCase().includes(searchQuery.toLowerCase())
    );

    return (
        <div className="p-6 min-h-screen">
            <div className="mb-4">
                <SearchBar setSearchQuery={setSearchQuery} />
                <Filters setCategory={setCategory} />
            </div>
            <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                {filteredProducts.map((product) => (
                    <ProductCard key={product.id} product={product} />
                ))}
            </div>
        </div>
    );
};

export default Home;