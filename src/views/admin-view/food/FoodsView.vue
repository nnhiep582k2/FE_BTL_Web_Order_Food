<template>
    <BaseButton
        :type="ButtonType.success"
        className="btn_add"
        text="Add"
        @click="router.push({ path: '/admin/create-foods' })"
    />
    <BaseTable :headers="titleList" :items="items" entity="Foods" />
</template>

<script setup lang="ts">
import BaseButton from '@/components/BaseButton.vue';
import { ButtonType } from '@/enums/ButtonType';
import { useRouter } from 'vue-router';
import BaseTable from '@/components/BaseTable.vue';
import { SET_LOADING } from '@/stores/storeConstants';
import { ref } from 'vue';
import { useStore } from 'vuex';
import http from '@/services/http/http';

const router = useRouter();

const titleList = [
    'foodId',
    'categoryId',
    'foodName',
    'foodStar',
    'foodVote',
    'foodDiscount',
    'foodDesc',
    'foodStatus',
    'foodType',
    'price',
    'quantity',
    'name',
    'url',
    'createdDate',
    'createdBy',
];

const items = ref([]);
const store = useStore();
const getFoods = async () => {
    try {
        store.dispatch(SET_LOADING, true);
        let { data } = (await http.get('/Foods/GetAllRecord')).data;
        items.value = data;
    } catch (error) {
        store.dispatch(SET_LOADING, false);
    } finally {
        store.dispatch(SET_LOADING, false);
    }
};

getFoods();
</script>

<style scoped lang="scss"></style>
