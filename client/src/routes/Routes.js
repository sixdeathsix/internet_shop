import {ShopPage} from '../pages/ShopPage';
import {AuthPage} from '../pages/AuthPage';
import DevicePage from '../pages/DevicePage';
import AdminPage from '../pages/AdminPage';
import ErrorPage from '../pages/ErrorPage';
import {BasketPage} from '../pages/BasketPage';
import {DevicesPage} from '../pages/DevicesPage';
import { UserPage } from '../pages/UserPage';

export const adminRoutes = [
  {path: '/admin', element: <AdminPage />, exact: true},
]

export const privateRoutes = [
  {path: '/user', element: <UserPage />, exact: true},
  {path: '/basket', element: <BasketPage />, exact: true},
]

export const publicRoutes = [
  {path: '/', element: <ShopPage />, exact: true},
  {path: '/login', element: <AuthPage />, exact: true},
  {path: '/registration', element: <AuthPage />, exact: true},
  {path: '/device', element: <DevicesPage />, exact: true},
  {path: '/device/:id', element: <DevicePage />, exact: true},
  {path: '*', element: <ErrorPage />, exact: true},
]