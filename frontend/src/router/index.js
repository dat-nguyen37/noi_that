import Acount from '@/components/acount/Acount.vue'
import ChangePass from '@/components/changepass/ChangePass.vue'
import OrderView from '@/components/order/OrderView.vue'
import OrderDetail from '@/components/orderDetail/OrderDetail.vue'
import AboutView from '@/views/AboutView.vue'
import CartView from '@/views/CartView.vue'
import CheckoutView from '@/views/CheckoutView.vue'
import ContactView from '@/views/ContactView.vue'
import DepartmentView from '@/views/DepartmentView.vue'
import HomeView from '@/views/HomeView.vue'
import ProductAll from '@/views/ProductAll.vue'
import ProductDetail from '@/views/ProductDetail.vue'
import ProfileView from '@/views/ProfileView.vue'
import SearchView from '@/views/SearchView.vue'
import Vue from 'vue'
import VueRouter from 'vue-router'
import store from '../store/store';


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/product',
    name: 'productdetail',
    component: ProductDetail
  },
  {
    path: '/cart',
    name: 'cart',
    component: CartView
  },
  {
    path: '/search',
    name: 'search',
    component: SearchView
  },
  {
    path: '/category/:id',
    name: 'category',
    component: DepartmentView
  },
  {
    path: '/product/all',
    name: 'productall',
    component: ProductAll
  },
  {
    path: '/checkout',
    name: 'checkout',
    component: CheckoutView
  },
  {
    path: '/pages/about',
    name: 'about',
    component: AboutView
  },
  {
    path: '/pages/contact',
    name: 'contact',
    component: ContactView
  },
  {
    path: '/profile',
    component: ProfileView,
    meta: { requiresAuth: true },

    children: [
      {
        path: '',
        name: 'account', 
        component: Acount
      },
      {
        path: '/profile/changePass',
        name: 'changePass', 
        component: ChangePass
      },
      {
        path: '/profile/orders',
        name: 'order', 
        component: OrderView
      },
      {
        path: '/profile/order',
        name:'orderdetail',
        component: OrderDetail,
        meta: {
          title: 'Chi tiết đơn hàng',
        },
      },
    ]
  },
  {
  path: '/admin',
    component: ()=> import('../views/AdminView.vue'),
    meta: { requiresAuth: true , hideNavbar: true , hideFooter: true ,requiresAdmin: true },
    children: [
      {
        path: '', 
        name: 'adminHome',
        component: ()=> import('../components/admin/Home/HomeView.vue'),
        meta: { requiresAuth: true , hideNavbar: true , hideFooter: true ,requiresAdmin: true },
      },
      {
        path: 'product',
        name: 'adminProduct', 
        component: ()=> import('../components/admin/Product/ProductView.vue'),
        meta: { requiresAuth: true , hideNavbar: true , hideFooter: true ,requiresAdmin: true },
      },
      {
        path: 'detail',
        name: 'detail', 
        component: ()=> import('../components/admin/Product/ViewProduct.vue'),
        meta: { requiresAuth: true , hideNavbar: true , hideFooter: true ,requiresAdmin: true },
      },
      {
        path: 'category',
        name: 'adminCategory', 
        component:()=> import('../components/admin/Category/CategoryView.vue'),
        meta: { requiresAuth: true , hideNavbar: true , hideFooter: true ,requiresAdmin: true },
      },
      {
        path: 'order',
        name: 'adminOrder', 
        component:()=> import('../components/admin/Order/OrderView.vue'),
        meta: { requiresAuth: true , hideNavbar: true , hideFooter: true ,requiresAdmin: true },
      },
      {
        path: 'user',
        name: 'adminUser', 
        component:()=> import('../components/admin/User/UserView.vue'),
        meta: { requiresAuth: true , hideNavbar: true , hideFooter: true ,requiresAdmin: true },
      },
      {
        path: 'imageCollection',
        name: 'imageCollection', 
        component:()=> import('../components/admin/Image/ImageCollection/ImageCollection.vue'),
        meta: { requiresAuth: true , hideNavbar: true , hideFooter: true ,requiresAdmin: true },
      },
      {
        path: 'imageCollection/listImage/:id',
        name: 'listImage', 
        component:()=> import('../components/admin/Image/ListImage/ListImage.vue'),
        meta: { requiresAuth: true , hideNavbar: true , hideFooter: true ,requiresAdmin: true },
      },
      {
        path: 'voucher',
        name: 'voucher', 
        component:()=> import('../components/admin/Voucher/VoucherView.vue'),
        meta: { requiresAuth: true , hideNavbar: true , hideFooter: true ,requiresAdmin: true },
      },
    ]
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.beforeEach((to, from, next) => {
  if (to.meta.title) {
    document.title = to.meta.title;
  }
  if (to.meta.requiresAdmin && !store.getters.isAdmin) {
    alert("Bạn không thể truy cập")
    next({ path: '/' });
  }
  next();
});


export default router
