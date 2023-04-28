import { AboutPage } from './pages/about/AboutPage.tsx';
import { ContactPage } from './pages/contact/ContactPage.tsx';
import { HomePage } from './pages/home/HomePage.tsx';
import { ServicesPage } from './pages/services/ServicesPage.tsx';
import { ShopPage } from './pages/shop/ShopPage.tsx';

export const topRoutes = [
    {
      path: "/",
      element:  <HomePage />,
      id: 'home'
    },
    {
      path: "/shop",
      element:  <ShopPage />,
      id: 'shop'
    },
    {
      path: "/services",
      element:  <ServicesPage />,
      id: 'services'
    },
    {
      path: "/about",
      element:  <AboutPage />,
      id: 'about'
    },
    {
      path: "/contact",
      element:  <ContactPage />,
      id: 'contact'
    },
  ];