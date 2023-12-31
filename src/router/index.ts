import { createRouter, createWebHistory } from 'vue-router';
import AboutView from '@/views/about-view/AboutView.vue';
import PromotionsView from '@/views/promotion-view/PromotionsView.vue';
import MenuView from '@/views/menu-view/MenuView.vue';
import TableView from '@/views/table-view/TableView.vue';
import LoginView from '@/views/auth-view/LoginView.vue';
import RegisterView from '@/views/auth-view/RegisterView.vue';
import OrderView from '@/views/order-view/OrderView.vue';
import HomeView from '@/views/home-view/HomeView.vue';
import CartView from '@/views/cart-view/CartView.vue';
import AdminView from '@/views/admin-view/AdminView.vue';
import CheckoutView from '@/views/checkout-view/CheckoutView.vue';

export const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: '/',
            name: 'home',
            component: HomeView,
        },
        {
            path: '/about',
            name: 'about',
            component: AboutView,
        },
        {
            path: '/promotions',
            name: 'promotions',
            component: PromotionsView,
        },
        {
            path: '/menu/:item',
            name: 'menu',
            component: MenuView,
        },
        {
            path: '/table',
            name: 'table',
            component: TableView,
        },
        {
            path: '/register',
            name: 'register',
            component: RegisterView,
        },
        {
            path: '/order',
            name: 'order',
            component: OrderView,
        },
        {
            path: '/cart',
            name: 'cart',
            component: CartView,
        },
        {
            path: '/login',
            name: 'login',
            component: LoginView,
        },
        {
            path: '/checkout',
            name: 'checkout',
            component: CheckoutView,
        },
        {
            path: '/admin',
            name: 'admin',
            component: AdminView,
            children: [
                // user
                {
                    path: 'auth',
                    name: 'admin.auth',
                    component: () =>
                        import('@/views/admin-view/user/UsersView.vue'),
                },
                {
                    path: 'create-auth',
                    name: 'admin.create-auth',
                    component: () =>
                        import('@/views/admin-view/user/CreateUsersView.vue'),
                },
                {
                    path: 'edit-auth',
                    name: 'admin.edit-auth',
                    component: () =>
                        import('@/views/admin-view/user/EditUsersView.vue'),
                },
                // foodImage
                {
                    path: 'foodImages',
                    name: 'admin.foodImages',
                    component: () =>
                        import(
                            '@/views/admin-view/foodImage/FoodImagesView.vue'
                        ),
                },
                {
                    path: 'create-foodImages',
                    name: 'admin.create-foodImages',
                    component: () =>
                        import(
                            '@/views/admin-view/foodImage/CreatefoodImagesView.vue'
                        ),
                },
                {
                    path: 'edit-foodImages',
                    name: 'admin.edit-foodImages',
                    component: () =>
                        import(
                            '@/views/admin-view/foodImage/EditfoodImagesView.vue'
                        ),
                },
                // food
                {
                    path: 'foods',
                    name: 'admin.foods',
                    component: () =>
                        import('@/views/admin-view/food/FoodsView.vue'),
                },
                {
                    path: 'create-foods',
                    name: 'admin.create-foods',
                    component: () =>
                        import('@/views/admin-view/food/CreateFoodsView.vue'),
                },
                {
                    path: 'edit-foods',
                    name: 'admin.edit-foods',
                    component: () =>
                        import('@/views/admin-view/food/EditFoodsView.vue'),
                },
                // cart
                {
                    path: 'carts',
                    name: 'admin.carts',
                    component: () =>
                        import('@/views/admin-view/cart/CartsView.vue'),
                },
                {
                    path: 'create-carts',
                    name: 'admin.create-carts',
                    component: () =>
                        import('@/views/admin-view/cart/CreateCartsView.vue'),
                },
                {
                    path: 'edit-carts',
                    name: 'admin.edit-carts',
                    component: () =>
                        import('@/views/admin-view/cart/EditCartsView.vue'),
                },
                // payment
                {
                    path: 'payments',
                    name: 'admin.payments',
                    component: () =>
                        import('@/views/admin-view/payment/PaymentsView.vue'),
                },
                {
                    path: 'create-payments',
                    name: 'admin.create-payments',
                    component: () =>
                        import(
                            '@/views/admin-view/payment/CreatePaymentsView.vue'
                        ),
                },
                {
                    path: 'edit-payments',
                    name: 'admin.edit-payments',
                    component: () =>
                        import(
                            '@/views/admin-view/payment/EditPaymentsView.vue'
                        ),
                },
                // payment orders
                {
                    path: 'paymentOrders',
                    name: 'admin.paymentOrders',
                    component: () =>
                        import(
                            '@/views/admin-view/payment-order/PaymentOrdersView.vue'
                        ),
                },
                {
                    path: 'create-paymentOrders',
                    name: 'admin.create-paymentOrders',
                    component: () =>
                        import(
                            '@/views/admin-view/payment-order/CreatePaymentOrdersView.vue'
                        ),
                },
                {
                    path: 'edit-paymentOrders',
                    name: 'admin.edit-paymentOrders',
                    component: () =>
                        import(
                            '@/views/admin-view/payment-order/EditPaymentOrdersView.vue'
                        ),
                },
                // bill
                {
                    path: 'bills',
                    name: 'admin.bills',
                    component: () =>
                        import('@/views/admin-view/bill/BillsView.vue'),
                },
                {
                    path: 'create-bills',
                    name: 'admin.create-bills',
                    component: () =>
                        import('@/views/admin-view/bill/CreateBillsView.vue'),
                },
                {
                    path: 'edit-bills',
                    name: 'admin.edit-bills',
                    component: () =>
                        import('@/views/admin-view/bill/EditBillsView.vue'),
                    props: true,
                },
                // bill details
                {
                    path: 'billDetails',
                    name: 'admin.billDetails',
                    component: () =>
                        import(
                            '@/views/admin-view/bill-details/BillDetailsView.vue'
                        ),
                },
                {
                    path: 'create-billDetails',
                    name: 'admin.create-billDetails',
                    component: () =>
                        import(
                            '@/views/admin-view/bill-details/CreateBillDetailsView.vue'
                        ),
                },
                {
                    path: 'edit-billDetails',
                    name: 'admin.edit-billDetails',
                    component: () =>
                        import(
                            '@/views/admin-view/bill-details/EditBillDetailsView.vue'
                        ),
                    props: true,
                },
                // category
                {
                    path: 'categorys',
                    name: 'admin.categorys',
                    component: () =>
                        import('@/views/admin-view/category/CategorysView.vue'),
                },
                {
                    path: 'create-categorys',
                    name: 'admin.create-Categorys',
                    component: () =>
                        import(
                            '@/views/admin-view/category/CreateCategorysView.vue'
                        ),
                },
                {
                    path: 'edit-categorys',
                    name: 'admin.edit-categorys',
                    component: () =>
                        import(
                            '@/views/admin-view/category/EditCategorysView.vue'
                        ),
                    props: true,
                },
                // role
                {
                    path: 'roles',
                    name: 'admin.roles',
                    component: () =>
                        import('@/views/admin-view/role/RolesView.vue'),
                },
                {
                    path: 'create-roles',
                    name: 'admin.create-roles',
                    component: () =>
                        import('@/views/admin-view/role/CreateRolesView.vue'),
                },
                {
                    path: 'edit-roles',
                    name: 'admin.edit-roles',
                    component: () =>
                        import('@/views/admin-view/role/EditRolesView.vue'),
                    props: true,
                },
                // order
                {
                    path: 'orders',
                    name: 'admin.orders',
                    component: () =>
                        import('@/views/admin-view/order/OrdersView.vue'),
                },
                {
                    path: 'create-orders',
                    name: 'admin.create-orders',
                    component: () =>
                        import('@/views/admin-view/order/CreateOrdersView.vue'),
                },
                {
                    path: 'edit-orders',
                    name: 'admin.edit-orders',
                    component: () =>
                        import('@/views/admin-view/order/EditOrdersView.vue'),
                    props: true,
                },
            ],
        },
        {
            path: '/:catchAll(.*)',
            component: () => import('@/views/notfound-view/NotFoundView.vue'),
        },
    ],
});

export default router;
