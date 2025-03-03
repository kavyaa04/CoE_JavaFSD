import { Link } from "react-router-dom";
import { useCart } from "../context/CartContext";

const Navbar = () => {
  const { cart } = useCart();

  return (
    <nav className="fixed top-0 left-0 w-full bg-white-600 text-black shadow-md z-50">
      <div className="max-w-6xl mx-auto px-4 py-4 flex justify-between items-center">
        <h1 className="text-5xl font-bold">
          <Link to="/">LuxeBuy :)</Link>
        </h1>
        <div className="space-x-6">
          {/* <Link to="/" className="hover:text-gray-300 transition">Home</Link> */}
          <Link to="/cart" className="relative text-xl font-bold hover:text-black-300 transition"
          >
            Cart 🛒
            {cart.length > 0 && (
              <span className="absolute -top-2 -right-3 bg-red-500 text-white text-xs px-2 py-0.5 rounded-full">
                {cart.length}
              </span>
            )}
          </Link>
        </div>
      </div>
    </nav>
  );
};

export default Navbar;