import React from 'react'
import ReactDOM from 'react-dom/client'
import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom";
import { ContactPage } from './pages/contact/ContactPage.tsx';
import { HomePage } from './pages/home/HomePage.tsx';
import { ShopPage } from './pages/shop/ShopPage.tsx';
import { PageRoot } from './pages/PageRoot.tsx';
import './main.css';

const router = createBrowserRouter([
  {
    path: "/",
    element:  <PageRoot />,
    children:[
      {
        path: "/",
        element:  <HomePage />,
      },
      {
        path: "/shop",
        element:  <ShopPage />,
      },
      {
        path: "/contact",
        element:  <ContactPage />,
      },
    ]
  },
  

]);

ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>,
)
