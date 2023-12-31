import { ref } from 'vue';
import { createStore } from 'vuex';
import {
    LOGIN_ACTION,
    SET_AUTH_DATA,
    SET_LOADING,
    FOOD_ACTION,
    SET_FOOD_LIST,
    LOGOUT_ACTION,
    ADMIN_ACTION,
    SET_ADMIN,
} from './storeConstants';
import { notify } from '@/services/Toast';
import { TypeToast } from '@/enums/TypeToast';
import http from '@/services/http/http';

interface IAuthData {
    userId: string;
    fullName: string;
    email: string;
    token: string;
    avatar: string;
}
interface IRootState {
    isLoading: boolean;
    authData: IAuthData;
}

export default createStore<IRootState>({
    state: {
        authData: ref<IAuthData>({
            userId: '',
            fullName: '',
            email: '',
            token: '',
            avatar: '',
        }),
        isLoading: ref<boolean>(false),
        allFoods: ref([]),
        isAdmin: ref<boolean>(false),
    },
    getters: {
        getAuthData: (state: any) => {
            return state.authData;
        },
    },
    mutations: {
        toggleLoading(state: IRootState, isOpen: boolean) {
            state.isLoading = isOpen;
        },

        [SET_AUTH_DATA](state: any, data: any) {
            if (data) {
                const newAuthData = {
                    userId: data?.userId,
                    fullName: data?.fullName,
                    email: data?.email,
                    token: data?.token,
                    avatar: data?.avatar,
                };
                state.authData = newAuthData;
            } else {
                state.authData = data;
            }
        },
        [SET_FOOD_LIST](state: any, data: any) {
            state.allFoods = data;
        },
        [SET_ADMIN](state: any, isAdmin: boolean) {
            state.isAdmin = isAdmin;
        },
    },
    actions: {
        [SET_LOADING]({ commit }: any, isOpen: boolean) {
            commit('toggleLoading', isOpen);
        },

        async [LOGIN_ACTION]({ commit }: any, payload: object) {
            try {
                const { data } = await http.post(
                    '/Auth/login',
                    JSON.stringify(payload)
                );
                if (data?.success) {
                    commit(SET_AUTH_DATA, data.data);
                }
            } catch (error: any) {
                notify(`${error?.response?.data?.message}`, TypeToast.error);
            }
        },

        async [FOOD_ACTION]({ commit }: any) {
            try {
                const { data } = await http.get('/Foods/GetAllRecord');
                if (data.success) {
                    commit(SET_FOOD_LIST, data.data);
                }
            } catch (error: any) {
                notify(`${error?.response?.data?.message}`, TypeToast.error);
            }
        },

        [LOGOUT_ACTION]({ commit }: any, data: object) {
            try {
                commit(SET_AUTH_DATA, data);
            } catch (error: any) {
                notify(`${error?.response?.data?.message}`, TypeToast.error);
            }
        },

        [ADMIN_ACTION]({ commit }: any, isAdmin: boolean) {
            commit(SET_ADMIN, isAdmin);
        },
    },
    modules: {},
});
