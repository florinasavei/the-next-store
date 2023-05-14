import React from 'react'
import ReactDOM from 'react-dom/client'
import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom";
import i18n from "i18next";
import { initReactI18next } from "react-i18next";
import HttpBackend from 'i18next-http-backend';


i18n
  .use(HttpBackend)
  .use(initReactI18next)
  .init({
    lng: 'ro',
    fallbackLng: 'en',
    backend: {
      loadPath: '/locales/{{lng}}/{{ns}}.json'
    }
  });

import { PageRoot } from './pages/PageRoot.tsx';
import './main.css';
import { topRoutes } from './routes.tsx';

const router = createBrowserRouter([
  {
    path: "/",
    element:  <PageRoot />,
    children: topRoutes
  },
]);

ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>,
)
